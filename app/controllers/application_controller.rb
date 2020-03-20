class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  private
  
  def require_login
    redirect_to '/users/new' unless session[:current_user_id]
  end  

  def user_signed_in
    return true unless session[:current_user_id] == nil
  end
end
