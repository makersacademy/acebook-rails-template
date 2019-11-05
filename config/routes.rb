Rails.application.routes.draw do
  get'welcome/index'
  root 'welcome#index'
  
  get 'welcome/login'
  root 'welcome#login'

  get 'welcome/signup'
  root 'welcome#signup'
  
  resources :posts
end
