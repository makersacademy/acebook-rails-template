Rails.application.routes.draw do
  get '/', to: 'users#new'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'posts/index', to: 'posts#index'
  get 'posts/:id/edit', to: 'posts#edit'
  patch 'posts/:id', to: 'posts#update'
  delete 'posts/:id', to: 'posts#delete'
  delete 'sessions/:id', to: 'sessions#destroy'

  resources :sessions
  resources :posts
  resources :users
  devise_for :users
  get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  resources :users, only: [:show]
end
