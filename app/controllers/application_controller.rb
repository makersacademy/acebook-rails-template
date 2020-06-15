class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in_user

  def logged_in_user
    @logged_in_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
