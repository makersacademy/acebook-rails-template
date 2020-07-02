class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end

  def check
    p user_params
    @user = User.find(user_params)
    if @user != nil
      redirect_to users_url
    # else
    #   redirect_to posts_url
    end
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
