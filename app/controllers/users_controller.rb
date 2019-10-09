class UsersController < ApplicationController
  def new
  end

  def create
    # render plain: params[:user][:email].inspect
    @user = User.new(user_params)
    @user.save
    redirect_to  '/'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)

  end

end
