Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :users
  resources :posts
  resources :comments

end
