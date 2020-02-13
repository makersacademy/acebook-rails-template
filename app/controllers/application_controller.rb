class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :redirect_if_not_logged_in
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end 

  def logged_in?
    !current_user.nil?
  end 

  def redirect_if_not_logged_in
    # redirect_to '/' unless logged_in? //not link to login
  end 
end
