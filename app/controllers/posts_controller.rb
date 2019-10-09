class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    params[:user_id] = 1
    @post = Post.create(post_params)
    redirect_to posts_url
    p params
  end

  def index
    @posts = Post.all.sort_by(&:created_at).reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
