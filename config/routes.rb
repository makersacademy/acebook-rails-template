Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations",
                                    sessions: "users/sessions" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"

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

  resources :posts do
    member do
      put "like", to: "posts#like"
      put "unlike", to: "posts#unlike"
    end
  end

  resources :comments do
    member do
      put "like", to: "comments#like"
      put "unlike", to: "comments#unlike"
    end
  end
end
