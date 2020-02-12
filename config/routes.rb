Rails.application.routes.draw do
  get 'homepage/index'

  get 'signup', to: 'users#new'

  resources :users
  resources :posts

  root 'homepage#index'
end
