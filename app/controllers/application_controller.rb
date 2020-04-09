class ApplicationController < ActionController::Base 
  protect_from_forgery with: :exception
  before_action :authenticate_user! do
    p user_signed_in?
    p current_user
    p user_session 
  end
  
end
