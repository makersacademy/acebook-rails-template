class RegistrationsController < Devise::RegistrationsController

  after_action :create_timeline, only: [:create]

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

    def create_timeline
        Timeline.create(user_id: @user.id)
    end
end
