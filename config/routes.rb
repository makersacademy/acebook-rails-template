Rails.application.routes.draw do
  resources :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  root 'welcome#index'

  get "/users/new", to: "users#new"
  post "/users", to: "users#create"

end
