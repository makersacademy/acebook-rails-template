class PostsController < ApplicationController

  def create
    begin
      @post = Post.create!(post_params)
      respond_to do |format|
        format.html do
          flash[:primary] = "Posted!"
          redirect_back fallback_location: "/"
        end
        format.js
        format.json { render json: @post}
      end
    rescue => exception
      @error = exception.message
      respond_to do |format|
        format.html do
          flash[:danger] = exception.message
          redirect_back fallback_location: "/"
        end
        # if invalid post, flashes error message & goes back to posts/new
        format.js
        format.json { render json: @error }
      end
    end 
  end

  def show
    @post = Post.find(params[:id])
    @new_post = Post.new
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    @original_post = @post.original_post
  end

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id]).increment!(:likes)
    respond_to do |format|
      format.html { redirect_back fallback_location: "/"}
      format.js
      format.json { render json: @post}
    end
  end

  private

  def post_params
    post = params.require(:post).permit(:content, :original_post_id)
    post[:user_id] = session[:user]["id"]
    return post
  end
end
