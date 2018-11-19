class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_registration_confirmation_url
  end

  def index
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
