class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  protected

  def require_login
    redirect_to(root_path) unless session[:user]
  end
end
