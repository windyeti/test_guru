Rails.application.routes.draw do

  get 'feedbacks/new'
  get 'feedbacks/create'
  root to: 'tests#index'

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
    resources :gists, shallow: true, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
