Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :posts do
    resources :likes
  end
  root to: 'home#index'
end
