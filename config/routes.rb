Rails.application.routes.draw do

  resources :profiles do
    resources :bios
    resources :posts
  end

  devise_for :users
  # resources :users, :only =>[:show]

  root 'posts#homepage'

  match '/users/:id', to: 'users#show', via: 'get', :as => :users_profile_page
  match '/users', to: 'users#index', via: 'get', :as => :users_homepage

  match "/profiles/:id", to: "profiles#create", via: "post", :as => :create_post

  # match '/profiles/createpost', to: 'profiles#createpost' via: 'post', :as => profiles_create_post


end
