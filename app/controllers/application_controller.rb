class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:student, :mentor]
  def after_sign_in_path_for(_resource)
    if current_user.type == "Student"
      student_dashboard_path(current_user.id) 
    else
      mentor_dashboard_path(current_user.id)
    end
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  protected
  def authenticate_user!
    redirect_to root_path, :notice => 'Please login' if user_signed_in? == false 
  end
end

