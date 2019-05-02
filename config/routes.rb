# frozen_string_literal: true

Rails.application.routes.draw do
  get 'albums/new'

  get 'albums/index'

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  resources :posts, :users, :albums
end
