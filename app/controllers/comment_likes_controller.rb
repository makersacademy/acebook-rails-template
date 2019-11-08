class CommentLikesController < ApplicationController

  def new
    create(params[:comment_id], params[:redirect])
  end

  def create(comment_id, redirect_path)
    unless CommentLike.find_by(comment_id: comment_id, user_id: session[:user_id])
      @comment_like = CommentLike.create(comment_id: comment_id, user_id: session[:user_id])
    end
    redirect_to redirect_path || '/posts'
  end

  def destroy
    @comment_like = CommentLike.find(params[:id])
    @comment_like.destroy
    redirect_to_previous_page
  end

  private

  def redirect_to_previous_page
    redirect = session[:path] || '/posts'
    session[:path] = nil
    redirect_to redirect
  end
end
