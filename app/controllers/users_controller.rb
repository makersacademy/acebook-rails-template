class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,:password))
    # keep code in to log user in after sign up
    # session[:user_id] = @user.id
    redirect_to '/posts'
  end
end
