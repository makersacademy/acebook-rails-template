class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create([{ username: user_params["username"], password: user_params["password"] }])
    redirect_to posts_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
