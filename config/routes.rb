Rails.application.routes.draw do
  devise_for :users
  
  # devise_scope :user do
  #   unauthenticated :user do
  #     root :to => 'devise/registrations#new', as: :unauthenticated_root
  #   end
  #   authenticated :user do
  #     root :to => 'posts#index', as: :authenticated_root
  #     resources :posts 
  #   end
  # end
  resources :posts
  root to: 'posts#index'
  # get :to => 'posts/new', redirect root
end


