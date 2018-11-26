Rails.application.routes.draw do

  get '/', to: 'users#new'
  get 'posts/index', to: 'posts#index'
  get 'posts/:id/edit', to: 'posts#edit'
  patch 'posts/:id', to: 'posts#update'
  delete 'posts/:id', to: 'posts#delete'
  delete  'sessions/:id', to: 'sessions#destroy'

  resources :sessions
  resources :posts
  resources :users
end
