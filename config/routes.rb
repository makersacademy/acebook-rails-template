Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :likes
  end
  devise_for :users

  root 'posts#index'
  get 'comments/index'
end
#forheroku
