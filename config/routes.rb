Rails.application.routes.draw do
  get 'users/create'

  get 'users/login'

  post 'users/sign_up'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users
end
