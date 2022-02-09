Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
 # if this doesn't work, root to: 'posts#index'
  resources :posts
end
