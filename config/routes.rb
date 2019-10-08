Rails.application.routes.draw do
  get 'welcome/index'
  # match 'welcome/index' => "users#show", :as => :user_root, via: [:get, :post]

  devise_for :users

  authenticated :user do
    root :to => 'users#show'
    resources :posts
    resources :users
  end
  unauthenticated :user do
    root 'welcome#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
