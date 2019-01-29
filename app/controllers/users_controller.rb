class UsersController < ApplicationController
  def new
  end

  def create
    # render plain: params[:users].inspect

    @user = User.new(user_params)
    @user.save
  end

  private
  def user_params
    params.require(:users).permit(:username, :email, :password)
  end
end
