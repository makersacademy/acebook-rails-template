class PostsController < ApplicationController

  def new
    # check_for_user
    @post = Post.new
    # @user_id = session[:user_id]
  end

  def create
    # check_for_user
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    # check_for_user
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, 'user_id')
  end

  def check_for_user
    if session[:user_id] === nil
      redirect_to new_user_url
    end
  end
end
