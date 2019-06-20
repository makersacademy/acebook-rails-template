class UsersController < ApplicationController
  # def index
  #
  # end

  def new
    @user = User.new
  end
  #
  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)

    @user.save
    redirect_to @user
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
