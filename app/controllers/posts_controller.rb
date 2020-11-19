class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params["message"], user_id: session[:current_user_id])
    redirect_to posts_url
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.owned_by(session[:current_user_id])
      @post.update(message: post_params["message"]) 
    else
      flash[:warning] = "Error: You can only edit your own posts."
    end
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
    @current_user = User.find_by_id(session[:current_user_id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
