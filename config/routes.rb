Rails.application.routes.draw do
  get'welcome/index'
  root 'welcome#index'
  
  get 'devise/registrations'
  root 'devise#registrations'

  # get 'welcome/signup'
  # root 'welcome#signup'
  
  resources :posts
end
