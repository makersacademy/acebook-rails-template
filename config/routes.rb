# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'
  match 'friendships/search' => 'friendships#search', via: :get, as: 'friendships_search'
  match 'friendships/create' => 'friendships#create', via: :post, as: 'friendships_create'
  resources :posts
  match 'users/:id' => 'users#show', via: :get, as: 'profile_page'
  resources :comments, except: [:new]
  get 'posts/:id/comments/new' => 'comments#new'
  match 'users/:id' => 'users#remove', via: :delete, as: 'delete-user'
  resources :post_likes
  match 'posts/:id/post_likes/new' => 'post_likes#new', via: :get, as: 'post_likes_new'
end
