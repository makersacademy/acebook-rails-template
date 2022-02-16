# redirecting to posts index even when posting on user wall 



class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @posts = @user.posts.order(created_at: :desc)
    @posts = Post.all.where(receiver_id: params[:id]).order("created_at DESC")
    @post = Post.new
  end

  def create
    User.create(user_params)
    redirect_to current_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  
end
