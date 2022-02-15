Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  #HTML route          Controller_name  #method
  get '/users/sign_up', to:'registrations#new'

  get '/posts/new', to: 'posts#new'
  get 'posts/:id/edit', to: 'posts#edit'
  resources :posts do
    resources :likes
  end
end
