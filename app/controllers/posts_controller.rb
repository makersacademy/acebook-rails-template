class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # p post_params
    # p current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.order("created_at DESC")
  end

  private

  def post_params
    # p params
    params.require(:post).permit(:message)
  end
end
