Rails.application.routes.draw do
  get 'walls/index'

  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :walls

  root to: 'home#index'
end
