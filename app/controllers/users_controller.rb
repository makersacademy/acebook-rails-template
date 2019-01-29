class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    # render plain: params[:users].inspect
    @user = User.create(user_params)
    # @user.save
    redirect_to @user
  end

  private
  def user_params
    params.require(:users).permit(:username, :email, :password)
  end
end
