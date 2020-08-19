class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    unless logged_in?
      flash[:alert] = "Naughty fish! You must be logged in to view this this page"
      redirect_to '/'
    end
  end


end
