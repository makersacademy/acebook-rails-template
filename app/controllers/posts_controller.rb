class PostsController < ApplicationController

  def create
    begin
      Post.create!(user_id: session[:user]["id"], content: post_params["content"])
    rescue => exception
      flash[:danger] = exception.message
      redirect_to "/posts/new"
      # if invalid post, flashes error message & goes back to posts/new
    else
      flash[:primary] =  "Posted"
      redirect_to "/timeline"
    end 
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
