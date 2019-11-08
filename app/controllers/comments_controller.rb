class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
   @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    redirect_to_previous_page if edit_not_verify?
  end

  def create
    current_user = session[:user_id]
    post_id = params[:post_id]
    @comment = Comment.new(comment_params)
    redirect_path = params.require(:comment).permit(:redirect_path)[:redirect_path]
    @comment.save
    redirect_to redirect_path
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to_previous_page
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to_previous_page
  end

private
  def comment_params
    params.require(:comment).permit(:text,:post_id, :user_id, :id)
  end

  def redirect_to_previous_page
    redirect = session[:path]
    session[:path] = nil
    redirect_to redirect
  end

  def edit_not_verify?
    Time.now-@comment.updated_at > 600 || session[:user_id] != @comment.user_id
  end
end
