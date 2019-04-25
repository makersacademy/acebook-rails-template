class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  include ApplicationHelper


  include SessionsHelper

  private

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to access that page"
      redirect_to root_url
    end
  end
end
