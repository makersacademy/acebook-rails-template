Rails.application.routes.draw do
  devise_for :users
  
  resources :posts

  devise_scope :user do
    unauthenticated do
     root :to => 'devise/sessions#new'
    end

    authenticated do
     root :to => 'posts#index'
  end
   end
  end
