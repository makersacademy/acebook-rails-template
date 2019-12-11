Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :posts, shallow:false
  end
 #  resources :posts do
 #    # get '/:user_id', on: :collection, action: :create_wall
 #    # , defaults: { user_id: true}
 #    member do
 #      get 'wall_create'
 #  end
 # end
# resources :posts, only: :create_wall, param: :user_id

  root 'posts#index'

  controller 'posts' do
    get '/:user_id'=> "posts#index"
  end
end
