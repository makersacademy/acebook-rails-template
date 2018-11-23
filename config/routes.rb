Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :posts do
    member do
      post 'like'
    end
    resources :comments do
      member do
        post 'like'
      end
    end
  end

  authenticated :user do
    root to: 'welcome#index'
  end

  resources :users, only: [:show]

  root to: redirect('/users/sign_in')

  root 'welcome#index'
end
