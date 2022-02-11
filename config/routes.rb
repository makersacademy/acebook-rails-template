Rails.application.routes.draw do
  root 'posts#index'

  get '/posts/new', to: 'posts#new'
  get 'posts/:id/edit', to: 'posts#edit'
  resources :posts
end
