Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    # resources :likes
    resources :comments do
    end
  end
  post '/posts/:post_id/like', to: 'likes#upvote', as: 'like_post'
  post '/posts/:post_id/unlike', to: 'likes#downvote', as: 'unlike_post'
end
