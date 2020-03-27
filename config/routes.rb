Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      devise_for :users
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      root  'posts#index'
      resources :posts
      resources :users
    end
  end
end
