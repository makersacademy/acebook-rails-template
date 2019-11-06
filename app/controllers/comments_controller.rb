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
    current_user = session[:user_id]
    post_id = params[:id]
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to @comment
  end

private
  def comment_params
    params.require(:comment).permit(:text,:post_id, :user_id, :id)
  end
end
