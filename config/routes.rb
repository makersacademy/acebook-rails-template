# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'


  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get  '/signup', to: 'users#new'
  resources :posts

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
