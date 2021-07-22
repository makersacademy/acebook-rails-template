class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p @post = Post.create(post_params)
    p post_params["message"]
    p post_params["images"]
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def like
    
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
