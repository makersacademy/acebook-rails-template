class UsersController < ApplicationController
  def new
  end

  # def show
  #   @user = User.find(params[:id])
  #   redirect_to new_user_path
  # end


  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
