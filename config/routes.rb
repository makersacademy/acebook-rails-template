Rails.application.routes.draw do
  get 'users/profile'
  get 'welcome/index'

<<<<<<< HEAD
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
=======
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
>>>>>>> master

  get 'users/:id' => 'users#profile'
  get ':username' => 'users#profile'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "unlike", to: "posts#downvote"
    end
  end

  get 'users/:user_id/posts/new' => 'posts#new'

  root to: "welcome#index"

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
