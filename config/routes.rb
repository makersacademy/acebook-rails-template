# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  #get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# get 'site/home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts
  resources :users
  resources :friendships
  resources :posts do
    resources :likes
  end
end
