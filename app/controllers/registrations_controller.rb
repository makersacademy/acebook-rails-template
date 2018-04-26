class RegistrationsController < Devise::RegistrationsController

  def avatar
    @user = current_user
  end

  def create_avatar
    update
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation, :current_password)
  end
end
