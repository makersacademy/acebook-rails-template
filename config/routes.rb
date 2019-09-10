# This is your application's routing file which holds entries in a special DSL 
# (domain-specific language) that tells Rails how to connect incoming requests to controllers and actions.



Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
