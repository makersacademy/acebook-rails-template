Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      # Commented out as to allow us to do our own authentication:
      devise_for :users
      get 'home/index'

      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      resources :posts
      resources :users
      resource :sessions, only: [:create, :destroy]
      

      root 'home#index'
    end
  end
end
