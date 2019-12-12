Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'posts/create'
  get 'users/:id/', to: 'users#show'


  namespace :api do
    resources :posts do
      resources :likes
    end
  end

  delete '/api/posts/:post_id/likes/', :to => 'api/likes#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :posts do
    resources :likes
  end

  # root 'posts#index'
  # root 'users#show'
  root 'posts#index'

end
