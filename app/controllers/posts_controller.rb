class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:id, :message, :user_id)
  end
end
