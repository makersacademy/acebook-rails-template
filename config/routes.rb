Rails.application.routes.draw do

  devise_for :users
  resources :users, :only =>[:show]

  resources :posts

  root 'posts#homepage'

  match '/users/:id', to: 'users#show', via: 'get'
  match '/users', to: 'users#index', via: 'get'

end
