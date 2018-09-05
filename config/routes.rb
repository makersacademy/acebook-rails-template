# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  root 'posts#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :posts do 
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
end


