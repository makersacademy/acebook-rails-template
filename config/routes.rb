Rails.application.routes.draw do

  root 'sessions#welcome'

  resources :users, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  resources :posts do
    get 'like', on: :member
    resources :comments
  end
end

