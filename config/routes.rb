Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :users
  resources :posts

  resources :sessions, only: [:new, :create, :destroy], :comments
  
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"


end
