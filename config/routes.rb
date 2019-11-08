Rails.application.routes.draw do
  get 'welcome/index'
  get 'posts' => 'posts#index', as: :user_root

  devise_for :users, controllers: { omniauth_callbacks: 'usrs/omniauth_callbacks' }

  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
  end

  root to: "welcome#index"

  devise_scope :user do
    selete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
