class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    user = User.find(params[:user_id])
    @post = user.posts.create(post_params)
    redirect_to user_posts_path(user)
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
