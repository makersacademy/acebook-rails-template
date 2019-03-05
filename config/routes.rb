Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :posts do
    resources :likes
  end
  get ':wall/posts/new', action: :new, controller: 'posts'
  get ':wall', action: :wall, controller: 'posts'
end
