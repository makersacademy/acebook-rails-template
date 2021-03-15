# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#home'
  devise_for :users
  resources :posts
end
