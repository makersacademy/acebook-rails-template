class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    p @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path(@post)
  end


  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
