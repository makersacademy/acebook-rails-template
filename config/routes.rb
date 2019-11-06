# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      
  get 'welcome/index'
  root 'welcome#index'

  get 'devise/registrations'
  root 'devise#registrations'

  # get 'welcome/signup'
  # root 'welcome#signup'

  resources :posts
end
