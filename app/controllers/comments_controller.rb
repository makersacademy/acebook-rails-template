class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
   @comment = Comment.find(params[:id])
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to @comment
  end

private
  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end
