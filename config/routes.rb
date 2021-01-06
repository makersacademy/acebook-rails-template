Rails.application.routes.draw do
  root "posts#index"

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]
  get '/logout', controller: 'sessions', action: 'destroy'

  resources :posts do
    resources :comments
  end
end
