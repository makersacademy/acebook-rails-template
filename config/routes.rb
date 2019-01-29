Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'posts#home'
  resources :posts
  root 'posts#home'

end

# Prefix Verb   URI Pattern                    Controller#Action
# new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
# user_session POST   /users/sign_in(.:format)       devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
# new_user_password GET    /users/password/new(.:format)  devise/passwords#new
# edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
# user_password PATCH  /users/password(.:format)      devise/passwords#update
#          PUT    /users/password(.:format)      devise/passwords#update
#          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
# new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
# edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
# user_registration PATCH  /users(.:format)               devise/registrations#update
#          PUT    /users(.:format)               devise/registrations#update
#          DELETE /users(.:format)               devise/registrations#destroy
#          POST   /users(.:format)               devise/registrations#create
#     home GET    /home(.:format)                posts#home
#    posts GET    /posts(.:format)               posts#index
#          POST   /posts(.:format)               posts#create
# new_post GET    /posts/new(.:format)           posts#new
# edit_post GET    /posts/:id/edit(.:format)      posts#edit
#     post GET    /posts/:id(.:format)           posts#show
#          PATCH  /posts/:id(.:format)           posts#update
#          PUT    /posts/:id(.:format)           posts#update
#          DELETE /posts/:id(.:format)           posts#destroy
#     root GET    /                              posts#home
