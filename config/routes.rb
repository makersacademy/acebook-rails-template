Rails.application.routes.draw do
  root "users#new"

  get "/posts_api", to: "posts#posts_api"
  resources :sessions, only: [:create, :new]

  delete 'session' => 'sessions#destroy'

  resources :posts
  resources :users
end
