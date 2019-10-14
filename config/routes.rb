Rails.application.routes.draw do
  post 'messages', to: 'messages#create'
 root 'users#show'
 get '/users/nonfriends', :controller => 'users', :action => 'nonfriends'
 

  devise_for :users
  authenticated :user do
    resources :posts
    resources :friendships do
      post 'create'
    end
  end

  unauthenticated :user do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
