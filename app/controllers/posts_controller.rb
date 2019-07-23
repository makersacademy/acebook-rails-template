class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
