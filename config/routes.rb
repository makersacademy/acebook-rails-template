Rails.application.routes.draw do
  devise_for :users, :controllers => { sign_up: 'registrations' }
  root to: 'posts#index'
  resources :posts, :shallow => true do
    resources :comments do
      member do
        post 'like'
      end
    end
  end
end
