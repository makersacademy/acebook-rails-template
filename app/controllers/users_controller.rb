class UsersController < ApplicationController

  protect_from_forgery
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash[:success] = "Congratulations, you are signed up!"
    redirect_to posts_url
  end

private

  def user_params
    params.require(:user).permit([:email, :password])
  end

end

