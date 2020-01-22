class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(post_params)
    flash[:notice] = "Comment successful. Far out!"
    redirect_to "/#{session[:recipient_id]}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    owned_comment(@comment)
    @comment.destroy
    flash[:notice] = "Comment vapourised."
    redirect_to "/#{session[:recipient_id]}"
  end

  private

  def post_params
    params.require(:comment).permit(:message, :post_id)
  end

  def owned_comment(comment)
    unless current_user.id == comment.user_id
      flash[:alert] = "That comment doesn't belong to you"
      redirect_to "/#{session[:recipient_id]}"
    end
  end
end
