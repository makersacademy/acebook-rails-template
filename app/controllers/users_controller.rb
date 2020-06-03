class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p params
    @user = User.create(user_params)
    redirect_to '/sessions/new'
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end

end
