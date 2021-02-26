Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}


  #  authenticated :user do
  #   root 'posts#index', as: :authenticated_root
  # end
  root 'welcome#index'
 #   authenticated :user do
 #   root to: 'home#index', as: :authenticated_root
 # end
 # root to: redirect('/users/sign_in')

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # root to: 'post#index'
   # get 'new' => 'posts#new'
   resources :posts
end
