class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def show
  end

  def update
    @post.update(post_params) if @post.owner?(current_user)
    redirect_to posts_path
  end

  def destroy
    @post.destroy if @post.owner?(current_user)
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :image).merge(user_id: current_user.id)
  end
end
