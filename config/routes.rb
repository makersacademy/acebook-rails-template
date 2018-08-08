Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "session/create"
  resources :posts, :session, :users, :likes

  get '/' => 'users#new'

  get    'login'   => 'session#new'
  post   'login'   => 'session#create'
  delete 'logout'  => 'session#destroy'

  resources :users do
    resources :posts do
      resources :likes
    end
  end

end
