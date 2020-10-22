class CommentsController < ApplicationController
  # def index
  #   @comment = Comment.new
  #   @comments = Comment.all
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_url
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
