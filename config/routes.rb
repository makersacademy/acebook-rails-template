Rails.application.routes.draw do
  get 'homepage/index'

  resources :users
  resources :posts
  
  root 'homepage#index' 
end
