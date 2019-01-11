class PostsController < ApplicationController
  before_action :require_login
  before_action :find_users, only: [:show, :index]
  before_action :find_post, only: [:show, :destroy, :update]

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
    @post.destroy
    flash[:danger] = "Your post has been deleted"
    redirect_to user_path(@post.user)
  end

  def index
    @posts = Post.where("timeline_id IS NULL").order(created_at: :desc)
  end

  def show
  end

  def update
    if @post.update_attributes(post_params)
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

    def find_users
      @users = User.all.order(first_name: :asc)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
