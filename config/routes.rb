# frozen_string_literal: true

Rails.application.routes.draw do
  root "welcome#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'sessions/new'
  get "sessions/create"
  get 'sessions/destroy'

  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  delete '/posts/:id', to: 'posts#destroy', as: 'destroy_post'
end

