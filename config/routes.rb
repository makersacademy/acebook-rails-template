# frozen_string_literal: true

Rails.application.routes.draw do
root 'static_pages#home'
get  '/signup',  to: 'users#new'
  resources :posts, :users
end
