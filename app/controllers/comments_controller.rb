class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(post_params)
    flash[:notice] = "Comment successful. Far out!"
    redirect_to "/#{session[:recipient_id]}"
  end

  def edit
    @comment = Comment.find(params[:id])
    owned_comment(@comment)
    time_out(@comment)
  end

  def update
    @comment = Comment.find(params[:id])
    flash[:notice] = "Comment updated. Gnarly!"
    redirect_to "/#{session[:recipient_id]}" if @comment.update(post_params)
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

  def time_out(comment)
    if (Time.now - comment.created_at) > 600
      flash[:alert] = "Timed out - you cannot edit this comment"
      redirect_to "/#{session[:recipient_id]}"
    end
  end
end
