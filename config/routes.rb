Rails.application.routes.draw do
  get 'users/new'
  get 'posts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts
  

  root 'users#new'
end
