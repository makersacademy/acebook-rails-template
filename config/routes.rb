Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  authenticated :user do
    root to: 'posts#index'
  end

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

  root to: redirect('/users/sign_in')
end
