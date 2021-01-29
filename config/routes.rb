Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :user, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :session, only: [:new, :create, :destroy]
  root 'welcome#index'

  get "/users/new", to: "users#new"
  post "/users", to: "users#create"
  # Sessions routes
  get "/login", to: "session#new"
  post "/sign-up", to: "session#create"
  get "/logout", to: "session#destroy"

  # Sessions routes
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

end