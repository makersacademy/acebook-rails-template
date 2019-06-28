class PostsController < ApplicationController
  layout 'iteratethroughposts', only: [:index]

  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :edit?, only: [:edit, :update]

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

  private

  def correct_user
    @post = Post.find(params[:id])
    if session[:user_id] != @post.user_id
      flash[:notice] = 'You can only edit or delete your own posts'
      redirect_to posts_url
    end
  end

  def edit?
    @post = Post.find(params[:id])
    if Time.now > @post.created_at + 10.minutes
      flash[:notice] = 'You can only edit posts 10 minutes after it has been created'
      redirect_to posts_url
    end
  end

  def post_params
    params.require(:post).permit(:message, :user_id, :wall_id)
  end
end
