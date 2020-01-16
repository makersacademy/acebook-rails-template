class PostsController < ApplicationController

  before_action :require_login, only: [:index, :show]

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
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
