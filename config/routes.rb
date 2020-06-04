Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations, only:[:create]
      resources :posts
      resources :sessions, only:[:create, :destroy]

    end
  end
end




#  get 'users/new'

#  post 'users/create'

