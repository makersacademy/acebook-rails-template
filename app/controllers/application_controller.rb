class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def require_login
    unless current_user
      redirect_to sign_in_path
    end
  end
end
