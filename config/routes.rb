Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, :only => [:show, :update, :edit]
  resources :posts
  resources :likes
end


# look up nested resources
# think about what information in the request do you need
# to be able to create a valid post record

# what is the association between a post and a user?
