class PostsController < ApplicationController

  before_action :redirect_if_user_is_not_signed_in

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.sortedbymostrecent
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
