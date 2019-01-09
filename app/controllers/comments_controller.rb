class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = @post.comments.create(comment_params)
    redirect_to comments_url
  end

  def index
    @comments = Comment.all
  end

  def edit
     @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to comments_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
