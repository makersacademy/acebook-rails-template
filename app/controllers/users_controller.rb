class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to users_path
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
