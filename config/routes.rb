Rails.application.routes.draw do
  resources :friends
  get 'posts/index'

  get '/posts/:id/edit', to: 'posts#edit'

  # change name of route users/new to /signup in the address bar
  get 'signup', to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  resources :users do
    resources :posts
  end

  resources :posts, only: [:index]

  resources :sessions, only: %i[login login_attempt logout]

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#login_attempt'
  get 'logout', to: 'sessions#logout'
  patch 'friends/:id/confirm',to: 'friends#confirm', as: :confirm

  root 'sessions#login'
end
