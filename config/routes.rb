Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users
  resources :posts

  get '/:id', to: 'walls#show', as: 'wall'
  post '/walls', to: 'walls#create'

  unauthenticated :user do
    root 'pages#home', as: :unauthenticated_root
  end

  authenticated :user do
    root 'walls#show', as: :authenticated_root
  end
end
