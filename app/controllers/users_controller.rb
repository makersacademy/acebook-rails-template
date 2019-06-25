class UsersController < ApplicationController
  def new
  end

  # def show
  #   @user = User.find(params[:id])
  #   redirect_to new_user_path
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Please sign in'
      redirect_to users_path
    else 
      flash[:notice] = 'Invalid signup credentials'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
