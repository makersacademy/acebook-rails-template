class CommentsController < ApplicationController
  def create
    begin
      @comment = Comment.create!(comment_params)
      respond_to do |format|
        format.html do
          flash[:primary] =  "Added comment!"
          redirect_back fallback_location: "/"
        end
        format.js
        format.json { render json: @comment}
      end
    rescue => exception
      @error = exception.message
      respond_to do |format| 
        format.html do
          flash[:danger] = @error
          redirect_back fallback_location: "/"
        end
        format.js
        format.json { render json: @error }
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