Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resources :posts

  root 'sessions#welcome'
  get 'welcome/index'
  get 'index/index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'

  # get 'logout', :controller => 'sessions', :action => 'destroy'
  get 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'

  # map.resource :session

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
