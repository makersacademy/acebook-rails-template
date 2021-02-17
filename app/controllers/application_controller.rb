class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate_user!

  def authenticate_user!
    if current_user.nil? && ENV['RAILS_ENV'] != 'test'
      flash[:warning] = 'Please log in'
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end 

end
