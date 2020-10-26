Rails.application.routes.draw do
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                     }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  resources :posts
  resources :comments
  resources :users

  resources :posts do
    member do
<<<<<<< HEAD
      put 'like', to: 'posts#upvote'
      put 'unlike', to: 'posts#downvote'
=======
      put "like", to: "posts#like"
      put "unlike", to: "posts#unlike"
>>>>>>> af27ad011d46a88bf75be767a4f79c4df1c7fc2c
    end
  end
end
