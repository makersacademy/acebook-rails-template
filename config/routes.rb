Rails.application.routes.draw do
  get '/', to: 'users#new'
  get 'posts/index', to: 'posts#index'
  get 'posts/:id/edit', to: 'posts#edit'
  patch 'posts/:id', to: 'posts#update'
  delete 'posts/:id', to: 'posts#delete'

  resources :posts
  resources :users
end
