Rails.application.routes.draw do

  #INDEX route configuration
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'posts#index', as: :authenticated_root
    end
  end
  
  unauthenticated :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
  end

  #HTML route          Controller_name  #method
  get '/users/sign_up', to:'registrations#new'

  get '/posts/new', to: 'posts#new'
<<<<<<< HEAD
  get '/posts/:id/edit', to: 'posts#edit'
  resources :posts
=======
  get 'posts/:id/edit', to: 'posts#edit'
  resources :posts do
    resources :likes
  end
>>>>>>> a0424141cce5e03ec2369003152bb7a5a27900d0
end
