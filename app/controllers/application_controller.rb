class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:student, :mentor]
  def after_sign_in_path_for(_resource)
    if current_user.type == "Student"
      mentors_path
    else
      students_path
    end
  end
end
