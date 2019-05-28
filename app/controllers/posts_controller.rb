class PostsController < ApplicationController

  include SessionsHelper

  before_action :logged_in_user, only: [:edit, :update, :destroy, :new]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  # def show
  #   @post = Post.find(params[:id])
  # end

  def create
    user = User.find(session[:user_id])
    @post = user.posts.create(post_params)
    # @post = Post.create(post_params)
    p @post
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
