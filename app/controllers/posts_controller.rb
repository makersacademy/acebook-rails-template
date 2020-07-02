class PostsController < ApplicationController
  before_action :require_permission, only: [:edit, :destroy]

  def new
    @post = Post.new
    @user_id = current_user.id
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
    @user_id = current_user.id
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

  def index
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def require_permission
    if current_user != Post.find(params[:id]).user
      flash[:alert] = "Cannot change another user's post"
      redirect_to posts_url
    end
  end

end
