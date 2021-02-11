Rails.application.routes.draw do
  devise_for :users, :controllers => {
  registrations: 'registrations'
}
  resources :posts
  resources :users
  get 'users/:id/picture' => 'users#update_picture'
  post '/update_profile' => 'users#update_profile'
  post '/picture' => 'users#update_picture'
  post '/posts/like_post' => 'posts#like_post'

  devise_scope :user do
    unauthenticated do
      root :to => 'devise/sessions#new'
    end

    authenticated do
      root :to => 'posts#index'
    end
  end
end
