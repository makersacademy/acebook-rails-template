Rails.application.routes.draw do

  devise_for :users

  resources :posts

  resources :users

  get 'wall', to: 'posts#wall'

  # get 'users', to: 'views#show'

  root :to => 'home#index'
end
