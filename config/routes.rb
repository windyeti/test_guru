Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  get '/about', to: redirect('/public/about')

  resources :tests, only: :index do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end

      post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do

      get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
