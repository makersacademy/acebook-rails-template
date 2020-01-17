Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'
  
  resources :posts
  resources :users
  resources :sessions


  get 'signup' => 'user#new'  
  post 'signup' => 'user#create'  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  get 'posts' => 'posts#index'
  patch 'posts' => 'posts#edit'
  delete 'posts' => 'posts#delete'
  # root :to => 'user#new'
  

  root 'user#new'
  

  
end
