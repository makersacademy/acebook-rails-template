class PostsController < ApplicationController
  def new
    @post = Post.new
    @user_id = current_user.username
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

  private

  def post_params
    params.require(:post).permit(:message, :creator_id)
  end

end
