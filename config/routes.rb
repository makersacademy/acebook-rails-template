Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  get 'welcome/index'
  get 'posts/newsfeed'
  post '/comments' => 'comments#create'
  get 'posts/:id/' => 'posts#like_count'


  # Resource routing allows you to quickly declare all of the common routes for a given resourceful controller.
  # Instead of declaring separate routes for your index, show, new, edit, create, update and destroy actions,
  # a resourceful route declares them in a single line of code.
  resources :users, :comments

  resources :posts do
    member do
      put "like" => "posts#like"
    end
  end

  # delete 'users/sign_out'
  root 'welcome#index'
end
