Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'posts#home'
  resources :posts
  root 'posts#home'

end

# INITIAL

#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
# No route set at the beginning

# MODIFIED

#     home GET    /home(.:format)                posts#home

#    posts GET    /posts(.:format)               posts#index
#          POST   /posts(.:format)               posts#create
# new_post GET    /posts/new(.:format)           posts#new
# edit_post GET    /posts/:id/edit(.:format)     posts#edit
#     post GET    /posts/:id(.:format)           posts#show
#          PATCH  /posts/:id(.:format)           posts#update
#          PUT    /posts/:id(.:format)           posts#update
#          DELETE /posts/:id(.:format)           posts#destroy
#     root GET    /                              posts#home
