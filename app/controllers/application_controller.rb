class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  
  before_action :require_login
 
  private
 
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end