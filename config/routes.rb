Rails.application.routes.draw do

  resources :profiles
  resources :bios

  devise_for :users
  # resources :users, :only =>[:show]

  resources :posts

  root 'posts#homepage'

  match '/users/:id', to: 'users#show', via: 'get', :as => :users_profile_page
  match '/users', to: 'users#index', via: 'get', :as => :users_homepage

end
