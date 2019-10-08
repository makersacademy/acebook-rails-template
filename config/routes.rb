Rails.application.routes.draw do
  root 'welcome#index'
  resources :posts
  resources :register

  # get '/register', to: 'welcome#register'
end
