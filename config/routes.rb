Rails.application.routes.draw do

  devise_for :users
  root 'devise#registrations#new'

  #HTML route          Controller_name  #method
  get '/users/sign_up', to:'registrations#new'

  get '/posts/new', to: 'posts#new'
  get 'posts/:id/edit', to: 'posts#edit'
  resources :posts
end
