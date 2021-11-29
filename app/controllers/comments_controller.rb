class CommentsController < ApplicationController
  
  def new 
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment = Comment.create(comments_params)
    redirect_to posts_url
  end

  def index
    @comment = Comment.new
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
