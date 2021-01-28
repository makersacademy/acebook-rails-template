Rails.application.routes.draw do
  root "users#new"

  resources :sessions, only: [:create, :new, :destroy]

  resources :posts
  resources :users
end
