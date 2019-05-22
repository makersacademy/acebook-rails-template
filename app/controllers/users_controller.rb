class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    @user.save

    # redirect_to users_url
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
