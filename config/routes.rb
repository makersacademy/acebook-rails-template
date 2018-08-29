# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'users/new' - Dani commented this out to make `users/new` the default page for now
  # root 'users/new'
  get 'users/new' 
  get '/home' => 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'session#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  resources :posts
end
