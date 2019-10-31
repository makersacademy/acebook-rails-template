# frozen_string_literal: true

Rails.application.routes.draw do
  get '/home/index'
  devise_for :users
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete 'posts/:id' => 'posts#destroy'
  resources :posts
end
