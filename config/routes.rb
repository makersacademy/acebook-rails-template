Rails.application.routes.draw do
  root "users#new"

  resources :sessions, only: [:create, :new]

  delete 'session' => 'sessions#destroy'

  resources :posts
  resources :users
end
