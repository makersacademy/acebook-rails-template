Rails.application.routes.draw do

  match 'like', to: 'likes#like', via: :post
  match 'unlike', to: 'likes#unlike', via: :delete
  resources :likes
  devise_for :users, controllers: { registrations: "users/registrations"}
    authenticated :user do
      root "users#index", as: :authenticated_root
    end
  resources :users
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end


end
