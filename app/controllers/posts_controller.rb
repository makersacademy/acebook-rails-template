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

  def show
    redirect_to posts_url
  end

  def destroy 
     post = Post.find(params[:id])
     post.destroy
     redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:message)
  end
end
