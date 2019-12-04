Rails.application.routes.draw do
  get 'home/index'

  # devise_for :users, controller: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controller: { sessions: 'users/' }
  resources :posts
  resources :users

  root 'home#index'


end
