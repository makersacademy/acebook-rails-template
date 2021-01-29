Rails.application.routes.draw do

  resources :user, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :session, only: [:new, :create, :destroy]
  root 'welcome#index'

  get "/users/new", to: "users#new"
  post "/users", to: "users#create"
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
end
