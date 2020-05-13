Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :sessions, only:[:new, :create, :destroy]
    end
  end
end




#  get 'users/new'

#  post 'users/create'

