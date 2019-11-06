class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_url
  end

  def update
    Post.update(update_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end
