class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  
  private
  
  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to "/" # halts request cycle
    end
  end

  def logged_in?
    session[:user] = User.find(1) if ENV['RAILS_ENV'] == "test" && session[:user].nil?
    !session[:user].nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
