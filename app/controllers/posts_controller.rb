class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @username = current_user.username
  end

  private

  def post_params
    params.require(:post).permit(:message, :created_at)
  end
end
