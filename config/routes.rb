Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/index'

  get 'users/new'

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
