Rails.application.routes.draw do
  get 'users/profile'
  get 'welcome/index'
  get 'posts' => 'posts#index', as: :user_root

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'users/:id' => 'users#profile'
  get 'users/:username' => 'users#profile'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "unlike", to: "posts#downvote"
    end
  end

  root to: "welcome#index"

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
