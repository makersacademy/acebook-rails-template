class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user: current_user))
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def like(user)
    likes << Like.new(user: user)
  end

  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
