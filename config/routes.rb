Rails.application.routes.draw do
  get 'signup' => 'user#new'  
  post 'signup' => 'user#create'  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # get 'logout' => 'sessions#destory'
  get 'posts' => 'posts#index'
  patch 'posts' => 'posts#edit'
  delete 'posts' => 'posts#delete'
  # root :to => 'user#new'
  resources :users
  resources :user
  resources :sessions

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
