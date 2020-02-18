class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login, :assign_user

  protected

  def assign_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to(root_path) unless session[:user_id]
  end
end
