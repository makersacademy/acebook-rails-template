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

  resources :friendships do
    member do
      put "addfriend", to: "friendships#addfriend"
      put "unfriend", to: "friendships#unfriend"
      put "accept", to: "friendships#accept"
      put "decline", to: "friendships#decline"
      put "block", to: "friendships#block"
      put "unblock", to: "friendships#unblock"
    end
  end

  resources :users do
   member do
     get "requests", to: "friendships#requests"
   end
 end
end
