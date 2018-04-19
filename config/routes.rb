# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # Resources should never be nested more than 1 level deep!

  resources :posts do
    resources :likes, only: [:create, :update]
    resources :comments
  end

  resources :comments do
    resources :likes, only: [:create, :update]
  end

  resources :users

  root 'welcome#index'
end
