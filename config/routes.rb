Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  # , only: [:new, :create, :index, :edit, :update, :show]
  root to: 'posts#index'
end
