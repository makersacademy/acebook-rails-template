Rails.application.routes.draw do
  
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome/index'
  
  resources :posts
  devise_for :users
end
