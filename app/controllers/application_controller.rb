class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :surname])
  end

  private

  # # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  #   request.referrer
  # end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      get '/users/sign_up'
    end
  end

end
