Rails.application.routes.draw do
  devise_for :users, :controllers => { sign_up: 'registrations' }
  resources :posts
  root to: 'posts#index'
  get '/:id/user', to: 'user#user', as: :user_page

end
