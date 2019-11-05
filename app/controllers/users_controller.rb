class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/'
  end

  private


  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name, :desired_attribute, :birthday, :profile_picture)
  end
end
