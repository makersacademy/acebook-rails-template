Rails.application.routes.draw do
  get 'welcome/index'

  resources :users

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/yours", to: "posts#yours"
  get "posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show", as: 'post'
  resources :posts

  get '*path' => redirect('/users/new')
end
