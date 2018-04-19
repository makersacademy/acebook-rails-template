class RegistrationsController < Devise::RegistrationsController

  def avatar
    20.times { p 'here fuckboy' }
    redirect_to posts_url
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation, :current_password)
  end
end
