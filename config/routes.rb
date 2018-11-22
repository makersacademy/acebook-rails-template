Rails.application.routes.draw do
  get '/', to: 'users#new'
  get 'posts/index', to: 'posts#index'
  get 'posts/:id/edit', to: 'posts#edit'
  patch 'posts/:id', to: 'posts#update'


  resources :posts
  resources :users
end
