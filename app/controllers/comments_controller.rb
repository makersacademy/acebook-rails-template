class CommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    @post = Post.find(params[:post_id])
    comment_hash = comment_params.merge(user_id: current_user.id)
    @comment = @post.comments.build(comment_hash)

    if @comment.save
      flash[:notice] = 'Comment was successfully created!'
    else
      flash[:alert] = 'Please enter a valid comment'
    end
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment was successfully deleted!'
    redirect_to posts_path
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html { redirect_to(@comment) }
      format.json { render json: { message: 'Comment was successfully edited!' } }
      format.json { respond_with_bip(@comment) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
