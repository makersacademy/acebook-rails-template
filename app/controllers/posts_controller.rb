class PostsController < ApplicationController
  # skip_before_action :login_required, :only => [:index]

  def new
    check_for_user
    @post = Post.new
  end

  def create
    check_for_user
    @post = Post.create(post_params)
    p session[:user_id]
    redirect_to posts_url
  end

  def index
    check_for_user
    @posts = Post.all
    p session[:user_id]
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
