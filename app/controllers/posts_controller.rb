class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC")
  end
  
  def show
    @post= Post.find(params[:post_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
