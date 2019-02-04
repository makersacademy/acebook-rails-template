class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to root_url, notice: "You need to sign in first"
    end
  end

  helper_method :current_user

end