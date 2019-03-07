Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :likes
  end

  resources :users, only: [:index, :show]

  resources :albums, only: [:show]

  resources :photos, only: [:show]
  
  root to: 'posts#index'

end
