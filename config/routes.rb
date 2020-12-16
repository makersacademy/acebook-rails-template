Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :posts
  root to: 'home#index'
end
