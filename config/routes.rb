Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    # get '/:user_id', on: :collection, action: :create_wall
    # , defaults: { user_id: true}
    member do
      get 'wall_create'
  end
 end
resources :posts, only: :create_wall, param: :user_id


controller 'posts' do
  get '/:user_id'=> "posts#create_wall"
end



  root 'posts#index'
end
