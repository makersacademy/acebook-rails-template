class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  devise_group :user, contains: [:student, :mentor]
  def after_sign_in_path_for(_resource)
    if current_user.type == "Student"
      student_dashboard_path
    else
      mentor_dashboard_path
    end
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  protected
  def authenticate_user!
    redirect_to root_path, :notice => 'Please login' if user_signed_in? == false
  end
  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
