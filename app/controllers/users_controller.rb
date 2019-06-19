class UsersController < ApplicationController
  def index
    @user = User.new
    p @user
  end

  def create
    @user = User.create(user_params)
    session[:user] = @user
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :confirm_password)
  end

end
