Rails.application.routes.draw do
  get '/', to: 'users#new'
  get 'posts/index', to: 'posts#index'

  resources :posts
  resources :users
end
