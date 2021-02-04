Rails.application.routes.draw do
  root "users#new"

  get "/posts_api", to: "posts#posts_api"

  post "/likes/data", to: "likes#find_if_post_is_liked"
  post "likes/create", to: "likes#create"
  post "likes/destroy", to: "likes#destroy"

  resources :sessions, only: [:create, :new]

  get 'session' => 'sessions#destroy'

  resources :posts
  resources :users
  resources :likes
end
