class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(content: post_params["content"], user_id: session[:user_id])
    redirect_path = params.require(:post).permit(:redirect_path)[:redirect_path]
    redirect_to redirect_path
  end

  def index
    no_current_user
    @post = Post.new
    @posts = Post.all
    @comments = Comment.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(update_params)
    redirect_to_previous_page
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to_previous_page
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def update_params
    params.require(:post).permit(:content)
  end

  def redirect_to_previous_page
    redirect = session[:path]
    session[:path] = nil
    redirect_to redirect
  end
end
