Rails.application.routes.draw do
  

  get 'welcome/index'

  get 'sessions/new'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/yours", to: "posts#yours"
  resources :posts

end
