class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  private
  
  def require_login
    redirect_to '/users/new' unless session[:current_user_id]

  end  

end
