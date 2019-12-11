class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
 end

 def after_sign_in_path_for(resource)
    # user_posts_path(user_id: current_user.id)
    user_path(id: current_user.id)
 end
end
