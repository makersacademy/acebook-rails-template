Rails.application.routes.draw do
  get 'posts/index'
  get '/posts/:id/edit', to: 'posts#edit', as: 'post'
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users
  

 
  root 'users#new'
end
