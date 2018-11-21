class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(post_comment_params.merge({user_id: current_user.id, post_id: params[:post_id]}))
    redirect_to posts_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment deleted. What are you trying to hide?"
    redirect_to posts_path
  end

  def edit
    @post = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.editable?
      @comment.update(comment: params[:post][:comment])
      flash[:danger] = "Comment updated. Stop changing your story!"
    else
      flash[:danger] = "Fuck off, this is not yours!"
    end
    redirect_to posts_url
  end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end

end
