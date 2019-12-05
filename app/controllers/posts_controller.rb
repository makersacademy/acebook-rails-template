class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
    p @post
    p post_params
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:id, :message, :user_id)
  end
end
