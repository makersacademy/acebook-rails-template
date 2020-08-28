class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  helper_method :current_user

  private

  def require_login
    redirect_to login_url unless current_user
  end

end
