Rails.application.routes.draw do

  devise_for :students
  devise_for :mentors
  mount SimpleDiscussion::Engine => "/forum"

  resources :students
  resources :mentors

  root to: "pages#welcome"
  get 'mentor_dashboard' => 'mentors#index'
  get 'student_dashboard' => 'students#index'
end
