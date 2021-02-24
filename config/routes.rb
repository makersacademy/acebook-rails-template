Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'post#index'
  get 'new' => 'posts#new'
  resources :posts
end
