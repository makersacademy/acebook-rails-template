# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      signout: 'logout',
      sign_up: 'register'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :users
  end
  root 'posts#index'
  root to: 'posts#index'
end
