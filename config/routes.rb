Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  # resources :users
devise_scope :user do
  # get 'users/:id' => 'users#show', as: 'user'
  # get 'users/:id' => 'posts#index', as: 'user'
  get 'users/:id' => 'posts#index', as: 'user'
end


end
