class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
