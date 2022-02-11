Rails.application.routes.draw do
  root 'posts#index'

  get '/posts/new', to: 'posts#new'
  resources :posts
end
