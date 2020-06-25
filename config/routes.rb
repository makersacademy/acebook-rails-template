Rails.application.routes.draw do

  devise_for :students
  devise_for :mentors

  resources :students
  resources :mentors

  root to: "pages#welcome"
  get 'mentor_dashboard' => 'mentors#show'
  get 'student_dashboard' => 'students#show'
end

