class CommentsController < ApplicationController

  def create
    @current = current_user.comments.create(comment_params)
    flash[:notice] = "Your comment has been added"
    redirect_to posts_url
  end



  # def show 
  # @id = "HI I am a PARAM"

  # end 

  def destroy
    # @comment = Post.comments.find(params[:id])
        # if @comment.user_id === current_user.id
    # @comment.destroy
        # flash[:notice] = "Your Comment has been deleted"
        # elsif @comment.user_id != current_user.id
        # flash[:error] = "You cannot delete other people's posts"
        # end
   @comments = Post.comments.destroy(Comment.find(1))

         redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end
