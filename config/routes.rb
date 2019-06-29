Rails.application.routes.draw do

  root to: 'tests#index'

  get '/about', to: redirect('/public/about')

  resources :users, only: [:create, :new, :edit, :update]
  get :signup, to: 'users#new'

  resources :sessions, only: [:create]
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end

      post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do

      get :result, on: :member
  end



end
