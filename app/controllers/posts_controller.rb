class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_name = current_user.name
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc).all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
