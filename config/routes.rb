Rails.application.routes.draw do
  devise_for :users
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :posts


end
