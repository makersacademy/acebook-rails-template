Rails.application.routes.draw do
  get "welcome/index"
  
  resources :people
  get 'login/index'
  get 'welcome/index'
  post 'welcome/index'
  get 'signup/index'

  resources :posts

  root 'welcome#index'
end
