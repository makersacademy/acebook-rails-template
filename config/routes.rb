Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  #HTML route          Controller_name  #method
  get '/users/sign_up', to:'registrations#new'

  resources :posts
end
