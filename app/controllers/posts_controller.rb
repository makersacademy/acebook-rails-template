class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
      # redirect_to 'devise/registrations#new'
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.where(feed: true).order("created_at DESC")
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.env["HTTP_REFERER"]
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    render "edit"
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_url
    else 
      render "edit"
    end
  end
  
  private

  # def post_params
  #   params.require(:post).permit(:message, :user_id)
  # end

  def post_params
    params.require(:post).permit(:message, :receiver_id, :user_id, :feed)
  end
end
