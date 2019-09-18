class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :verify_logged_in

  def verify_logged_in
    unless current_user || (request.env["PATH_INFO"].include?("users")) || request.env["PATH_INFO"] == "/"
      redirect_to "/"
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path(current_user.id)
  end
end
