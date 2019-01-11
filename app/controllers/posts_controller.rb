class PostsController < ApplicationController
  before_action :require_login

  def new
    if current_user
      @post = Post.new
      @timeline_id = params[:timelineid]
    else
      redirect_to login_url
    end
  end

  def create
    if params[:post][:user_id] != ""
      create_timeline_post
    else
      create_global_post
    end
    redirect_to request.referer || posts_url
    flash[:success] = "Your post has been created"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = "Your post has been deleted"
    redirect_to user_path(@post.user)
  end

  def index
    @users = User.all.order(first_name: :asc)
    @posts = Post.where("timeline_id IS NULL").order(created_at: :desc)
  end

  def show
    @users = User.all.order(first_name: :asc)
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      p @post
      flash[:success] = "Your post has been updated"
      redirect_to request.referer || posts_url
    end
  end

  private

    def post_params
      params.require(:post).permit(:message, :timeline_id)
    end

    def create_timeline_post
      @user = User.find(params[:post][:user_id])
      @post = Post.create(post_params.merge(user_id: current_user.id, timeline_id: @user.timeline.id))
    end

    def create_global_post
      @post = Post.create(post_params.merge(user_id: current_user.id))
    end
end
