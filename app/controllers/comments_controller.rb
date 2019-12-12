class CommentsController < ApplicationController

  def create
    @current = current_user.comments.create(comment_params)
    flash[:notice] = "Your comment has been added"
    redirect_to posts_url
  end


  def destroy
        #  if current_user.comments.user_id === current_user.id
        #  flash[:notice] = "Your Comment has been deleted"
        #  elsif @comment.user_id != current_user.id
        #  flash[:error] = "You cannot delete other people's posts"
        #  end
   @comments = current_user.comments.destroy(params[:id])

         redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end
