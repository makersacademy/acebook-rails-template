class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super

    if resource.save
      resource.create_wall
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:real_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:real_name, :email, :password, :password_confirmation, :current_password)
  end
end
