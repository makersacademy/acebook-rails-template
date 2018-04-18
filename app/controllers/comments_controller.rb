class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    comment_hash = comment_params.merge(user_id: current_user.id)
    @comment = @post.comments.create(comment_hash)
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(comment_params)
        notice_message = 'Comment was successfully updated.'
        format.html { redirect_to(@comment, notice: notice_message) }
      else
        format.html { render action: 'edit' }
      end
      format.json { respond_with_bip(@comment) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
