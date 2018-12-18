class PostsController < ApplicationController
  def new
    if current_user
      @post = Post.new
    else
      redirect_to login_url
    end
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
