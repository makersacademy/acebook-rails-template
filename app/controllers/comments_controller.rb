class CommentsController < ApplicationController
  
  def new 
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comments_params)
    @comment.update(post_id: id_params)
    redirect_to posts_url
  end

  def index
    @comment = Comment.new
  end

  private

  def comments_params
    p params.require(:comment).permit(:comment)
  end

  def id_params
    params.require(:post_id)
  end
end
