Rails.application.routes.draw do
<<<<<<< HEAD
  resources :tests
  get 'pages/home'
||||||| 50b89d4
  get 'pages/home'
=======
>>>>>>> master

  get 'messages/index'

  get 'conversations/index'

  devise_for :students
  devise_for :mentors

  resources :mentors
  resources :students

<<<<<<< HEAD
  resources :posts
  root to: "posts#new"
||||||| 50b89d4
  resources :posts
=======
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
>>>>>>> master


  root to: "pages#welcome"
  get "/students/:id/dashboard" => "students#show"
  get "/mentors/:id/dashboard" => "mentors#show"
end
