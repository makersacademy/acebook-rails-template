class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(params[:comment])
    p @comment
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
