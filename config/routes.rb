# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/:user_id", to: "posts#index", constraints: { user_id: /\d+/ }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :posts, only: [:index, :new, :edit, :create, :update, :destroy]

  root "users#new"
end
