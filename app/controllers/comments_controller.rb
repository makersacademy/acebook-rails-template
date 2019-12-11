class CommentsController < ApplicationController

  def create
    current_user.comments.create(comment_params)
    flash[:notice] = "Your comment has been added"
    redirect_to posts_url
  end


  private

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end
