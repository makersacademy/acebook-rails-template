class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:username,:password,:email,:full_name,:lizard_species,:birthday,:profile_picture)
  end

end
