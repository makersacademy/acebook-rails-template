class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login

  private

  def require_login
    unless current_user
      flash[:not_logged_in_error] = 'You must be logged in to view this page.'
      redirect_to '/'
    end
  end

end
