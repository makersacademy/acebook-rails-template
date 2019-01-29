Rails.application.routes.draw do
  root 'welcome#index'
  get '/homepage', to: 'welcome#index'
  get '/signup', to: 'users#new'

 

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  # resources :posts
end
