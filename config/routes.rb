Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "unlike", to: "posts#downvote"
    end
  end

  root to: "welcome#index"

  get 'users/:id' => 'users#profile', as: :users_profile

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
