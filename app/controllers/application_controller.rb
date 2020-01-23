class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  helper_method :current_user, :find_user, :require_login, :find_name

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_name(user_id)
    @user = User.find_by({ id: user_id})
    p @user
    return @user.name
  end

  private

  def require_login
    redirect_to root_path unless current_user 
  end
end
