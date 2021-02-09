class CommentsController < ApplicationController
  def create
    begin
      @comment = Comment.create!(comment_params)
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
    comment = params.require(:comment).permit(:content)
    comment[:post_id] = params[:post_id]
    comment[:user_id] = session[:user]["id"]
    return comment
  end

end