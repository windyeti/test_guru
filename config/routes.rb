Rails.application.routes.draw do

  root to: 'tests#index'

  get 'show_user_badge', to: 'badges#show_user_badge'
  get 'show_all_badge', to: 'badges#show_all_badge'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {sessions: "users/sessions"}

  get '/about', to: redirect('/public/about')

  resources :feedbacks, only: [:new, :create]

  resources :tests, only: :index do
      post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
      get :result, on: :member
      post :gist, on: :member
  end

  namespace :admin do
    resources :badges, shallow: true, only: [:new, :create, :show]
    resources :gists, shallow: true, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
