Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'

  root 'posts#index'


 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :posts
  resources :users
end
