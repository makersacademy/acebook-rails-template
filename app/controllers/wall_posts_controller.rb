class WallPostsController < ApplicationController
before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @wallpost = WallPost.new
  end

  def create
    @user = User.find(params[:user_id])
    @wallpost = @user.wall_posts.create(wallpost_params)
    redirect_to user_url(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @wallpost = WallPost.find(params[:id])
    @wallpost.destroy
    redirect_to user_url(@user), notice: 'Your wall post has been deleted'
  end

  private

  def wallpost_params
    params.require(:wall_post).permit(:text, :sender_id)
  end

end
