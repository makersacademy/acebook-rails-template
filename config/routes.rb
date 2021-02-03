Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  devise_scope :user do
    unauthenticated do
     root :to => 'devise/sessions#new'
    end

    authenticated do
      root :to => 'posts#index'
    end
  end
end
