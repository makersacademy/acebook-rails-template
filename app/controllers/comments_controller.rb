class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:post_id]).order(created_at: :desc)
  end

  def create
    begin
      @comment = Comment.create!(post_id: params[:post_id], user_id: session[:user]["id"], content: comment_params["content"])
      flash[:primary] =  "Added Comment!"
    rescue => exception
      flash[:danger] = exception.message
      # if invalid post, flashes error message & goes back to posts/new
    end 
    redirect_back fallback_location: "/"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end