class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    binding.pry
    redirect_to posts_url
  end

  def index
    binding.pry
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
