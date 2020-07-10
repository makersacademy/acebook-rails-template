class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def require_login
    redirect_to sign_in_path if current_user.nil? 
  end

end
