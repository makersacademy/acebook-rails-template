Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes
    resources :comments
  end


  resources :users, only: [:show]
  get 'profile', to: 'users#show'

  ## Redirects to log in if not signed in
  ## Sets home page
  authenticated :user do
    root to: 'posts#index'
  end

  root to: redirect('/users/sign_in')
end
