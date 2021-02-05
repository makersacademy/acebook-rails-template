class PostsController < ApplicationController

  def create
    begin
      Post.create!(user_id: session[:user]["id"], content: post_params["content"])
    rescue => exception
      flash[:danger] = exception.message
      # if invalid post, flashes error message & goes back to posts/new
    else
      flash[:primary] =  "Posted"
    end 
    redirect_back fallback_location: "/"
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def update
    redirect_back fallback_location: "/"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
