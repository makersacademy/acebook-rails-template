# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users

  root "posts#new"


  get "registration/signup"
  post "registration/new"
  get "registration/index"

  get "/signup", to: 'users#new'
  



end
