Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  get '/error', to: 'errors#404'
  get '/:id', to: "users#show", as: :user_wall
  get '/comments/new/:id', to: "comments#new", as: :new_comment_to_post

  resources :users, :posts, :comments
end
