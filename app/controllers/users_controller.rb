class UsersController < ApplicationController

  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
