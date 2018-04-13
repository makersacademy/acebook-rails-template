class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_url and return unless @post.user_id == current_user.id
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
