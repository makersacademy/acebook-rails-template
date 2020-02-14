Rails.application.routes.draw do
  get 'homepage/index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'posts', to: 'posts#posts_all'


  resources :users do
    resources :posts
  end

  resources :posts

  root 'homepage#index'
end
