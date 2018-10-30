class WallPostsController < ApplicationController
before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @wallpost = WallPost.new
  end

  def create
    @user = User.find(params[:user_id])
    @wallpost = @user.wall_posts.create(wallpost_params)
    redirect_to posts_url
  end

  private

  def wallpost_params
    params.require(:wall_post).permit(:text, :sender_id)
  end
end
