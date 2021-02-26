class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to root_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
