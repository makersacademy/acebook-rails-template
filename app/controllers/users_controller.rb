class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end

  def login
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
