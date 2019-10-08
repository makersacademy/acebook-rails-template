Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users

  authenticated :user do
    root :to => 'users#show'
    resources :users do
      resources :posts
    end
  end

  unauthenticated :user do
    root 'welcome#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
