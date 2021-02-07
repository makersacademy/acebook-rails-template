class PostsController < ApplicationController

  def create
    begin
      @post = Post.create!(user_id: session[:user]["id"], content: post_params["content"])
      respond_to do |format|
          format.html { redirect_back fallback_location: "/", flash[:primary] =>  "Posted"}
          format.js
          format.json { render json: @post, flash[:primary] =>  "Posted" }
        end
    rescue => exception
      flash[:danger] = exception.message
      # if invalid post, flashes error message & goes back to posts/new
    end 
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
  Post.find(params[:id]).increment!(:likes)
    redirect_back fallback_location: "/"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
