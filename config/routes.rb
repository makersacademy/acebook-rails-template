Rails.application.routes.draw do
  get 'users/new' => 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, :users

  root 'posts#index'
  
end
