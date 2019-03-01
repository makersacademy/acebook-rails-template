class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: current_user.id)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  private

  def post_params
    params.require(:post).require(:message)
  end
end
