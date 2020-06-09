Rails.application.routes.draw do
  devise_for :users
  # get 'post/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  # root 'post#index'
  root to: 'posts#index'
end
