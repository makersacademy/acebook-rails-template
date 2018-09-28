Rails.application.routes.draw do

  get 'pages/home'

  devise_for :views
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users

  root 'pages#home'
end
