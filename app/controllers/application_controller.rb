class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :verify_logged_in

  def verify_logged_in
    unless current_user || (request.env["PATH_INFO"].include?("users")) || request.env["PATH_INFO"] == "/"
      redirect_to "/"
    end
  end
end
