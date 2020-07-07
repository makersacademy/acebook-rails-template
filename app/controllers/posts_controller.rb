class PostsController < ApplicationController
  before_action :require_permission, only: [:edit, :destroy]
  before_action :require_time_check, only: :edit

  def new
    @wall = params[:id]
    @post = Post.new
    @user_id = current_user.id
  end

  def create
    @post = Post.create(post_params)
    redirect_to wall_url(params[:id] = @post.wall_id)
  end

  def edit
    @post = Post.find(params[:id])
    @wall_id = @post.wall_id
    @user_id = current_user.id
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to wall_url(params[:id] = @post.wall_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to wall_url(params[:id] = @post.wall_id)
  end

  def index
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :wall_id)
  end

  def require_permission
    if current_user != Post.find(params[:id]).user
      flash[:alert] = "Cannot change another user's post"
      redirect_to wall_url(params[:id] = Post.find(params[:id]).wall_id)
    end
  end

  def require_time_check
    if Time.now - Post.find(params[:id]).created_at > 10.minutes
      flash[:alert] = "You can only edit a post for 10mins... 😥"
      redirect_to wall_url(params[:id] = Post.find(params[:id]).wall_id)
    end
  end

end
