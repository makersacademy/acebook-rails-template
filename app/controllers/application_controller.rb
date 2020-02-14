class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :redirect_if_not_logged_in
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id]) # crud method - READ - fetches data
  end 

  def logged_in?
    !current_user.nil? # checks that the user is logged in or not
  end 

  def redirect_if_not_logged_in # redirects to the homepage unless the user is logged in
    redirect_to '/' unless logged_in? 
  end 
end
