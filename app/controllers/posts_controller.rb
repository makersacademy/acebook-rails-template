class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    p @username = @user.username
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    
    redirect_to root_path if session[:user_id] == nil 
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post
    @post.destroy
    @post

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
