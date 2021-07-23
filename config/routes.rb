Rails.application.routes.draw do
   devise_for :users

   devise_scope :user do
     authenticated :user do
       root :to => 'posts#index', as: :authenticated_root
     end
     unauthenticated :user do
       root :to => 'devise/registrations#new', as: :unauthenticated_root
     end
   end
   
  devise_scope :posts do
    get "/posts/:id/like", to: "posts#like", as: "like"
  end
  
  resources :posts do
    resources :comments 
  end
end

