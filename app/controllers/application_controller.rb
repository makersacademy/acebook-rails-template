class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    '/posts'
  end

  before_action :authenticate 

  def authenticate
    redirect_to(root_path) unless current_user.nil?
  end

end
