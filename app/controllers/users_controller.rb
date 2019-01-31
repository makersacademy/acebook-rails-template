class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        redirect_to users_profile_url
      else
        redirect_to users_url
      end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :birthday,
      :password,
      :gender,
      :email
    )
  end

end
