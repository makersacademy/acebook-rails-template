class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:post_id]).order(created_at: :desc)
  end

  def create
    begin
      @comment = Comment.create!(post_id: params[:post_id], user_id: session[:user]["id"], content: comment_params["content"])
      flash[:primary] =  "Added comment!"
      respond_to do |format|
        format.html { redirect_back fallback_location: "/"}
        format.js
        format.json { render json: @comment}
    rescue => exception
      flash[:danger] = exception.message
      respond_to { |format| format.html { redirect_back fallback_location: "/"} }
      end
      # if invalid post, flashes error message & goes back to posts/new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end