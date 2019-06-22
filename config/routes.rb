# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  get 'posts/index'
  post 'posts/:id/edit' => 'posts#edit'
  patch 'posts.:id' => 'posts#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :users

  resources :posts do
    resources :likes
  end

  root 'users#new'
end
