class RegistrationsController < Devise::RegistrationsController
  after_action :add_new_timeline_to_user, only: [:create]
  private
    def sign_up_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :password,
                                    :password_confirmation,
                                    :current_password)
    end

    def add_new_timeline_to_user
      @user.create_timeline(user_id: @user.id)
    end
end
