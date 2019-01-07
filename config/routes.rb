Rails.application.routes.draw do

  resources :profiles do
    resources :bios
    resources :posts do
      resources :comments
    end
  end

  devise_for :users
  # resources :users, :only =>[:show]

  root 'posts#homepage'

  match '/users/:id', to: 'users#show', via: 'get', :as => :users_profile_page
  match '/users', to: 'users#index', via: 'get', :as => :users_homepage

  match "/profiles/posts", to: "posts#create", via: "post", :as => :create_post
  match "/profiles/bios", to: "bios#create", via: "post", :as => :create_bio
  match "/profiles/:profile_id/posts/:id/comments", to: "comments#create", via: "post", :as => :create_comment
  # match '/profiles/createpost', to: 'profiles#createpost' via: 'post', :as => profiles_create_post


end
