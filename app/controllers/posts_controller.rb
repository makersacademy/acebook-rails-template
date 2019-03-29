class PostsController < ApplicationController

  protect_from_forgery except: :index

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params()[:message], signup_id: session[:user])
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @user = session[:user]
  end

  def edit
    # p session[:user]
    # p Post.find_by(id: params[:post_id]).signup_id
    # p Post.find_by(id: params[:post_id]).signup_id == session[:user]
    # if Post.find_by(id: params[:post_id]).signup_id == session[:user]
      Post.update(params[:post_id], :message => params[:Message])
      redirect_to posts_url
    # else
    #   redirect_to posts_url
    # end
  end

  def update
    @post_id = params[:post_id]

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
