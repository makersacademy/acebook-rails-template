class ApplicationController < ActionController::Base
  # Redirects to log_in if not authenticated
  before_action :authenticate_user!
  protect_from_forgery with: :exception
end
