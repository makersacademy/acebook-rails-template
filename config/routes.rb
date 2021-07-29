Rails.application.routes.draw do
  get '/profile', to: 'profile#index'

  devise_scope :user do
    devise_for :users, controllers: { registrations: 'registrations' }
    get 'profile/edit', to: 'devise/registrations#edit', as: :edit_user_profile
  end

  devise_scope :user do
    authenticated :user do
      root to: 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # devise_scope :posts do
  #   get '/posts/:id/like', to: 'posts#like', as: 'like'
  # end

  get '/profile', to: 'profile#index'
  devise_scope :posts do
    get '/posts/:id', to: 'posts#comment', as: 'comment'
  end

  resources :posts do
    resources :comments
    resources :likes
  end
end
