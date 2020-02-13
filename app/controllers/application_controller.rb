class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  protected

  def require_login
    unless session[:user]
      redirect_to(root_path)
    end
  end
end
