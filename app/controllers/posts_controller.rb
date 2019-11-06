class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(content: post_params["content"], user_id: session[:user_id])
    redirect_to posts_url
  end

  def index
    no_current_user
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(update_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def update_params
    params.require(:post).permit(:content)
  end
end
