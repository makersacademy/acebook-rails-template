class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  
  private
  
  def require_login
    if logged_in?
      redirect_to "/users/log_out" unless User.exists?(session[:user]["id"])
    else
      flash[:danger] = "You must be logged in to access this section"
      redirect_to "/" # halts request cycle
    end
  end

  def logged_in?
    session[:user] = User.find(1) if ENV['RAILS_ENV'] == "test" && session[:user].nil?
    !session[:user].nil?
  end

end
