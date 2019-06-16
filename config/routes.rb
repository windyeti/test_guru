Rails.application.routes.draw do
  # get 'questions/index'
  # get 'questions/show'
  # get 'questions/create'
  # get 'questions/destroy'
  # get 'tests/index'
  # get 'tests/show'
  # get 'tests/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests do
      resources :questions, shallow: true
  end

end
