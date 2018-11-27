# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
     session[:user_id] ? @current_user ||= User.find(session[:user_id]) : nil
  end

end
