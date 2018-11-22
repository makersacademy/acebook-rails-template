# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable,
       :validatable, authentication_keys: [:login, :sign_up]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
    puts("sign up params from inside registration controller")
  end

  def configure_permitted_parameters
   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
   devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end
end
