Rails.application.routes.draw do
  devise_for :users
root 'pages#index'
  #get 'pages/index'

  get 'home' => 'pages#home'
  get '/users/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get 'explore' => 'pages#explore'
  get '/users/explore' => 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
