Rails.application.routes.draw do
  get 'posts/index'

  devise_for :users

  devise_scope :user do

    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home_page#home', as: :unauthenticated_root
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :posts do
      resources :comments
    end

    root 'home_page#home'

    get 'userprofile' => 'home_page#userprofile'

  end
end
