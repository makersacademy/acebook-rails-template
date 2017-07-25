class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    p @comment
    redirect_to posts_url
  end



  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
