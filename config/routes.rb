Rails.application.routes.draw do

  get 'users/new'

  post 'users/create'

  resource :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
