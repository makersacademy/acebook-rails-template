class PostsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @user_id = session[:user_id]
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
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
    if  session[:user_id] != @post.user_id
      p session[:user_id]
      p @post.user_id
      flash[:notice] = 'You can only edit your own posts'
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
