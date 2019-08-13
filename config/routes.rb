Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  root "sessions#new"
  root "sessions#create"
  root "sessions#destroy"

  resources :users
  root "users#new"
  root "users#index"

  resources :posts
  root "posts#index"
  root "posts#edit"
  root "posts#update"
  root "posts#destroy"
end
