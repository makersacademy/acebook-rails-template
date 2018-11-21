class PostsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.create(post_params)
    redirect_to user_posts_url(current_user)
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
    @posts = Post.order('updated_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
