class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(post_params)
    redirect_to "/#{session[:recipient_id]}"
  end

  private

  def post_params
    params.require(:comment).permit(:message, :post_id)
  end

end
