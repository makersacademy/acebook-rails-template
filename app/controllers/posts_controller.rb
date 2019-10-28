class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if user_signed_in?
      @post = Post.create(post_params)
    else
      redirect_to '/'
    end
      redirect_to posts_url
  end

  def index
    @posts = Post.all if user_signed_in?
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
