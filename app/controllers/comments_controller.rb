class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.users_id = session[:current_user_id]

    if @comment.save
      redirect_to post_path(session[:current_post_view]), flash: { success: "Comment posted successfully" }

    else
      redirect_to post_path(session[:current_post_view]), flash: { danger: "Comment ran into an error being posted..." }      
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :posts_id)
  end
end
