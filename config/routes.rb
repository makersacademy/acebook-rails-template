Rails.application.routes.draw do
  root "users#new"

  get "/posts_api", to: "posts#posts_api"
  post "/likes/data", to: "likes#find_if_post_is_liked"
  resources :sessions, only: [:create, :new]

  delete 'session' => 'sessions#destroy'

  resources :posts
  resources :users
  resources :likes
end
