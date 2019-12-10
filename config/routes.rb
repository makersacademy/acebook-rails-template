Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'posts/create'

  namespace :api do
    resources :posts do
      resources :likes
    end
  end



#   root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :posts do
    resources :likes
  end

  root 'posts#index'
end
