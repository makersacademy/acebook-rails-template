class PostsController < ApplicationController
  def new
    @post = Post.new
    # @user_id = session[:user_id]
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, 'user_id')
  end
end
