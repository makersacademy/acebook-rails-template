class PostsController < ApplicationController
  before_action :require_login unless ENV['RAILS_ENV'] == 'test'
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    p ENV['RAILS_ENV']
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
    params.require(:post).permit(:message)
  end
end
