# frozen_string_literal: true

Rails.application.routes.draw do

  get 'albums/:id/photo/new', to: 'albums#new_photo'
  post 'albums/:id/photo', to: 'albums#create_photo'

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  resources :posts, :users, :albums
end
