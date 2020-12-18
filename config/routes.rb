# frozen_string_literal: true

Rails.application.routes.draw do

<<<<<<< HEAD
=======
  root to: 'users#new'

  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'

>>>>>>> 7f51707f6b181b2f9ad4ceffc03750b95057a621
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#new'
  get 'users/new'

  resources :users, only: [:new, :create]
  resources :posts
end
