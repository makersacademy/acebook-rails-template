class PostsController < ApplicationController
  # skip_before_action :login_required, :only => [:index]

  def new
    check_for_user
    @post = Post.new
  end

  def create
    check_for_user
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    check_for_user
    @posts = Post.all.order(created_at: :desc)
  end

  def posts_api
    @posts = Post.all.order(created_at: :desc)
    render json: @posts
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def check_for_user
    if session[:user] === nil
      redirect_to new_user_url
    end
  end
end
