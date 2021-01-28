Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  # testing for heroku
  root 'welcome#index'

  post "/posts/create", to: "posts#create"
end
