class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :ethnicity)
  end
end
