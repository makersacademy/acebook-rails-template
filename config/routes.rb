Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  devise_scope :user do
    # get 'users/:id' => 'users#show', as: 'user'
    # get 'users/:id' => 'posts#index', as: 'user'
    get '/:id' => 'posts#index', as: 'user'
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    # resources :likes
    resources :comments do
    end
  end
  post '/posts/:post_id/like', to: 'likes#upvote', as: 'like_post'
  post '/posts/:post_id/unlike', to: 'likes#downvote', as: 'unlike_post'
  post '/posts/:post_id/comment/:comment_id/like', to: 'likes#upvote', as: 'like_post_comment'
  post '/posts/:post_id/comment/:comment_id/unlike', to: 'likes#downvote', as: 'unlike_post_comment'
end
