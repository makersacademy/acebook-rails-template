Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :posts do
  end
  root to: 'home#index'

  resources  :users do
    resources :posts, only: [:index]
  end
  get 'users/:id/user_posts' => 'users#user_posts', :as => :custom_user_posts

end
