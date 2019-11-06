Rails.application.routes.draw do
  # get 'welcome/index'

  devise_for :users, controllers: {
        sessions: 'users/sessions'}

  devise_scope :user do
    get 'users/profile', to: 'users/sessions#profile'
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  # root to: "welcome#index"

end
