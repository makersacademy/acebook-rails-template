Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  get '/ghghg' => 'posts#sjsjs'

  root 'posts#index'
end
