Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root 'home#index'
  # devise_for :users

  devise_scope :user do
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
