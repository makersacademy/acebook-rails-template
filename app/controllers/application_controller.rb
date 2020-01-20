class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user_path(user)
  end

  # unless Rails.application.config.consider_all_requests_local
  #   rescue_from Exception, :with => :render_404
  # end
  #
  # private
  #
  # def render_404
  #   render :template => 'error_pages/404', :layout => false, :status => :not_found
  # end

end
