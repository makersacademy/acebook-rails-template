class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

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

  def show
    @post = Post.find(params[:id])
  end

  def update
    find_post
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    find_post
    if @post.user_logged_in?(current_user)
      @post.destroy
      redirect_to posts_path
    else
      flash[:notice] = "Cannot delete"
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end
