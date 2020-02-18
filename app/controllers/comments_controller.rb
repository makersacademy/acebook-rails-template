# frozen_string_literal: true

class CommentsController < ApplicationController
  skip_before_action :authenticated_user

  def index; end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_back(fallback_location: home_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if comment_owner?(@comment)
      @comment.destroy 
      redirect_to posts_path
    else
      flash.now.alert = 'Apologies, this is not your comment to delete!'
      @posts = Post.order(created_at: :desc)
      render 'posts/index'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def comment_owner?(comment)
    comment.user_id == session[:user_id]
  end

end
