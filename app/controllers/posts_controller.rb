class PostsController < ApplicationController
  before_action :current_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    @post.update(post_params)

    redirect_to posts_url
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def current_post
    @post = Post.find(params[:id])
  end
end
