Rails.application.routes.draw do

  get 'welcome/index'

  root 'welcome#index'

  get 'index/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users
end
