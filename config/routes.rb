Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'posts/:post_id/likes/destroy_like_on_post', to: 'likes#destroy_like_on_post'

  root to: "posts#wall"
  resources :posts do
    resources :likes
  end
  get ':wall/posts/new', action: :new, controller: 'posts'
  get ':wall', action: :wall, controller: 'posts'
end
