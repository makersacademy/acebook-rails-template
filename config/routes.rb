Rails.application.routes.draw do
  resources :user
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

end
