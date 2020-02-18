# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_scope :user do
  #   get "/sign_in" => "devise/sessions#new"
  #   get "/sign_up" => "devise/registrations#new", as: "new_user" # custom path to sign_up/registration
  # end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'posts/index'
  get 'users/index'

  root 'posts#index'

  resources :posts
  resources :users
  
end
