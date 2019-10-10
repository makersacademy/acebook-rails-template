Rails.application.routes.draw do
 root 'users#show'
  devise_for :users
  authenticated :user do
    resources :posts
  end

  unauthenticated :user do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
