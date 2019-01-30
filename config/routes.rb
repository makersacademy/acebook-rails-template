Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home_page/index'
  root 'home_page#index'

  resources :users
  resources :posts
end
