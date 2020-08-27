class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(get_params)
    @user.save
    redirect_to "/sessions/new"
  end

  def show

  end

private

  def get_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :password, :email)
  end

end
