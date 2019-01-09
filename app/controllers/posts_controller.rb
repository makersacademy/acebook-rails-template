class PostsController < ApplicationController
  before_action :require_login

  def new
    if current_user
      @post = Post.new
    else
      redirect_to login_url
    end
  end

  def create
    if params[:post][:user_id] != ""
      @user = User.find(params[:post][:user_id])
      @post = Post.create(post_params.merge(user_id: current_user.id, timeline_id: @user.timeline.id))
      flash[:success] = "Your post has been created"
      redirect_to user_path(@user)
    else
      @post = Post.create(post_params.merge(user_id: current_user.id))
      flash[:success] = "Your post has been created"
      redirect_to posts_url
    end

  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:danger] = "Your post has been deleted"
    redirect_to posts_path
  end

  def index
    @posts = Post.where("timeline_id IS NULL").order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Your post has been updated"
      redirect_to posts_path
    end
  end

  private

    def post_params
      params.require(:post).permit(:message)
    end
end
