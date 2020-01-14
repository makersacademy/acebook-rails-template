Rails.application.routes.draw do
  get 'signup' => 'user#new'  
  post 'signup' => 'user#create'  
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'posts' => 'posts#index'
  # root :to => 'user#new'
  resources :user
  # resources :sessions

  # root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
