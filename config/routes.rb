Rails.application.routes.draw do
  get '/'
  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  root 'users#new'
  resources :posts
  resources :users
end
