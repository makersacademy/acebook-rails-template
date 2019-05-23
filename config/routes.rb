Rails.application.routes.draw do
  get 'welcome/index'

  resources :users
  resources :posts

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
