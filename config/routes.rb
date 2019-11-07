Rails.application.routes.draw do
  get 'welcome/index'
  get 'posts' => 'posts#index', as: :user_root

  devise_for :users

  get 'users/:id' => 'users#profile'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
  end

  root to: "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
