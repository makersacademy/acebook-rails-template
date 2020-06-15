Rails.application.routes.draw do
  devise_for :users, :controllers => { sign_up: 'registrations' }
  resources :posts, :shallow => true do
    resources :likes
  end
  root to: 'posts#index'
  get '/:id', to: 'user#user', as: :user_page
end
