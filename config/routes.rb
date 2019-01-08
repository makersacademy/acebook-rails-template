Rails.application.routes.draw do

  get 'users/index'

  resources :users do  
    resources :posts do
      delete '/commentes/:id' => 'commentes#destroy'
      resources :comments
    end
  end

  devise_for :users
  devise_scope :user do

    authenticated :user do
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home_page#home', as: :unauthenticated_root
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'home_page#home'
  end

  match "/users/:id", to: "posts#create", via: "post", :as => :create_post

end
