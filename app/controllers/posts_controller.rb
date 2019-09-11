class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p post_params
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
