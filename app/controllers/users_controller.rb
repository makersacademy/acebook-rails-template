class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    p "params[:user][:avatar]"
    p params[:file]
    p "before current_user"
    p current_user
    p "after current_user"
    current_user.avatar = params[:user][:avatar]
    p "current_user after assigning"
    p current_user.avatar
    p "end"
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
