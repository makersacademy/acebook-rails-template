class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:profilepic))
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])
  end

end


