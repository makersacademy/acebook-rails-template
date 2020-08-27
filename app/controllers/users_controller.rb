class UsersController < ApplicationController

  def show
    current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(get_params)
    @user.save
    session[:id] = @user.id
    redirect_to '/login'
  end

private

  def get_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end

end
