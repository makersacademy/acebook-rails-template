Rails.application.routes.draw do
  get 'users/profile'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  


    # authenticated :user do
      # root to: 'users/:id'
    # end


resources :posts do
  member do
    put "like", to: "posts#upvote"
    put "unlike", to: "posts#downvote"
  end
end

# root to: "welcome#index"

get ':username' => 'users#profile'
get 'users/:id' => 'users#profile'



# devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'posts#index'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

end
