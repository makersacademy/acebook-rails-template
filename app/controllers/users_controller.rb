class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create(email)
    @user = User.create
  end

  def index
    @users = User.all
  end
end

private

  def user_params
    params.require(:user)
  end
