class PostsController < ApplicationController
  layout 'iteratethroughposts', only: [:index]

  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @user_id = session[:user_id]
  end

  def create
    @post = Post.create(post_params)
    redirect_back(fallback_location: posts_path)
  end

  def index
    if session[:user_id].nil?
      redirect_to root_url
    else
      @user = User.find(session[:user_id])
      @posts = Post.order(created_at: :desc)
      @wall = Wall.find_by(user_id: @user.id)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def correct_user
    @post = Post.find(params[:id])
    if session[:user_id] != @post.user_id
      flash[:notice] = 'You can only edit your own posts'
      redirect_to posts_url
    end
  end

  private
  def post_params
    params.require(:post).permit(:message, :user_id, :wall_id)
  end
end
