Rails.application.routes.draw do

  resources :bios

  devise_for :users
  resources :users, :only =>[:show]

  resources :posts

  root 'posts#homepage'

  match '/users/:id', to: 'users#show', via: 'get'
  match '/users', to: 'users#index', via: 'get'

end
