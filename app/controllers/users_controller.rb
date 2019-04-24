class UsersController < ApplicationController

  protect_from_forgery
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end

  def index
    @users = User.all
  end


private

  def user_params
    params.require(:user).require(:email).require(:password)
  end
end
