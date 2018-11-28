Rails.application.routes.draw do
  devise_for :users, :controllers => { sign_up: 'registrations' }
  root to: 'posts#index'
  resources :posts, :shallow => true do
    resources :comments
    resources :likes
  end
  get '/:id', to: 'user#user', as: :user_page
  get 'errors/invalid-user-id'
end
