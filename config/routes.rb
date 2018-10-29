# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # resources :posts
<<<<<<< HEAD
  root to: 'posts#index'
=======
  root to: "posts#index"
>>>>>>> dead111b849dff44d98804f2bb3030c5b0ea3134
  resources :posts, :users
end
