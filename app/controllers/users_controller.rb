class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p "start"
    p params
    p "Hellooo Patrick"
    p user_params
    @user = User.create(user_params)
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
