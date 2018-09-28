class UsersController < ApplicationController

  def show
    find_user
    @posts = Post.where(user_id: params[:id]).order(created_at: :desc)
  end

  def update
    find_user
    @user.update(params.require(:user).permit(:profilepic))
    redirect_to @user
  end

  def edit
    find_user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
