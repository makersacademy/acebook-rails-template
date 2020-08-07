Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'

  resources :walls do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :likes

  end




  root 'sessions#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # resources :posts_old
end
