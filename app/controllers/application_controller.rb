class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate_user!

  def authenticate_user!
    session[:user_id] ||= 1 if ENV['RAILS_ENV'] == 'test'
    # during tests, user_id = 1
    
    if session[:user_id].nil?
      flash[:warning] = 'Please log in'
      redirect_to login_path
    end
  end

end
