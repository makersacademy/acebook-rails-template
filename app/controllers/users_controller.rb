class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash[:notice] = "Welcome #{user_params["full_name"]}"
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :email, :password)
  end
end
