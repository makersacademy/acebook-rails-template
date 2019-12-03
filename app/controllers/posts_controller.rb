class PostsController < ApplicationController
  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :username)
  end
end
