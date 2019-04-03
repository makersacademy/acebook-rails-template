class PostsController < ApplicationController

  protect_from_forgery except: :index

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params()[:message], signup_id: session[:user_id])
    session[:signup_id] = Post.find_by(params.require(:post).permit(:message)).signup_id
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @user_id = session[:user_id]
    @user = session[:user]
    @users = Signup.all
  end

  def edit
      Post.update(params[:post_id], :message => params[:Message])
      redirect_to posts_url
  end

  def update
    @post_id = params[:post_id]
  end

  def delete
    Post.destroy(params[:post_id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
