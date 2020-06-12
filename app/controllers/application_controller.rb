class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "This is not your post to edit!"
    redirect_to root_url, alert: exception.message
  end
end
