Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  get '/users/sign_up', to:'registrations#new'

  resources :posts
end
