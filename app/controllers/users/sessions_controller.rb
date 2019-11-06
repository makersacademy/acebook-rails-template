# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def profile
    if !user_signed_in?
      # flash[:error] = "Please sign in."
      redirect_to new_session_path(User)
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   p 'hello'
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
