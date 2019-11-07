Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "unlike", to: "posts#downvote"
    end
  end
  
  root to: "welcome#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
