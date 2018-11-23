class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(body: comment_params, commentable_id: params[:id], commentable_type: 'post')
    redirect_to '/posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
