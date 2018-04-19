Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users
  # get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'comments/index'
end
#forheroku
