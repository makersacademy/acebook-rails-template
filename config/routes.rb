# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :likes, :comments

    # resource :comments do
    #   resources :comment_likes
    # end

  end

  resources :comments do
    resources :comment_likes
  end

  root 'welcome#index'
end
