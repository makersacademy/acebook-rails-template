class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  private

  def require_login
    unless @current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/signup'
    end
  end

end
