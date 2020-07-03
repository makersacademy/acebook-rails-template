class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


before_action :require_login

private

  def require_login
    current_user = false
    unless (session[:user_id] != nil)
      p 'LOGGED IN'
      redirect_to '/login'
    end
  end
end
