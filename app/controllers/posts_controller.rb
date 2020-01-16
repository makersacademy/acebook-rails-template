class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = session[:user_id]
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order("updated_at DESC")
  end

  def delete
    @post = Post.find(params[:format])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
