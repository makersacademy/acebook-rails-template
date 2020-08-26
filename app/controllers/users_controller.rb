class UsersController < ApplicationController

  def new
    @user
  end

  def create
    @user = User.new(get_params)
    @user.save
    redirect_to @user
  end

private

  def get_params
    params.require(:user_details).permit(:first_name, :last_name, :password, :email)
  end

end
