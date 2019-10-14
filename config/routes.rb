Rails.application.routes.draw do
  root 'welcome#index'
  resources :posts
  resources :users
  resources :sessions
  mount API::Base, at: '/'
end
