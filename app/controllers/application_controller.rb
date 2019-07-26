class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_signup

  private

  def require_signup
    return false if current_user

    redirect_to signup_url
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
