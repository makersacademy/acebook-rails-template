Rails.application.routes.draw do
  get '404', to: 'errors#show', via: :all

  get 'homepage/index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    resources :posts
  end

  resources :posts

  root 'homepage#index'
end
