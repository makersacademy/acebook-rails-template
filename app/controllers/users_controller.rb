class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def index
    @users = User.all
  end
end

private

  def user_params
    params.require(:user).require(:email).require(:password)
  end
