Rails.application.routes.draw do
  get 'users/profile'
  get 'welcome/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'users/:id' => 'users#profile'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "unlike", to: "posts#downvote"
    end
  end

  root to: "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
