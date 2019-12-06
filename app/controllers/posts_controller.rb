class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def update
    @post =  Post.find(params[:id])
    if current_user == @post.user
      @post.update(post_params)
      redirect_to posts_url
    else
      flash[:alert] = "Error, this is not your post"
      redirect_to post_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
