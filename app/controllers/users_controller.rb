class UsersController < ApplicationController
  def new
    @user = User.new()
  end


  def create
  end

  def index
    @user = User.create(user_params)
      redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
