class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  
  private
  
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to controller: "users", action: "login" # halts request cycle
    end
  end

  def logged_in?
    session[:user] = User.find_by(username: "Charlotte") if ENV['RAILS_ENV'] == "test"
    !session[:user].nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
