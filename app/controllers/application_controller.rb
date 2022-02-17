class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def authenticate_user(current_user)!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end 

  def render_not_found
    render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
  end

  def after_sign_in_path_for(user)
    user_path(current_user.id)
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end
end
