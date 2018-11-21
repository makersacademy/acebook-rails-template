Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :posts

  authenticated :user do
    root to: 'welcome#index'
  end

  root to: redirect('/users/sign_in')

  root 'welcome#index'
end
