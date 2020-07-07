Rails.application.routes.draw do
  get 'profile/index'
  root "welcome#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/new'
  get "sessions/create"
  get 'sessions/destroy'
  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  resources :posts do
    resources :comments
    delete '/comments/:id', to: 'comments#destroy', as: 'destroy_comment'
  end
  delete '/posts/:id', to: 'posts#destroy', as: 'destroy_post'
end