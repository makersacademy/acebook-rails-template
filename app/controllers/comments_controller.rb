# frozen_string_literal: true

class CommentsController < ApplicationController
  skip_before_action :authenticated_user

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    flash[:notice] = 'Your comment has been successfully added.'
    redirect_back(fallback_location: home_path)
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if comment_owner?(@comment)
      @comment.update(comment_params)
      flash[:notice] = 'Your comment has been successfully edited.'
      redirect_to session[:url]
    else
      flash.now.alert = 'Apologies, this is not your comment to update!'
      render 'edit'
    end
  end

  def index; end

  def destroy
    @comment = Comment.find(params[:id])
    if comment_owner?(@comment)
      @comment.destroy
      flash[:notice] = 'Your comment has been successfully deleted.'
      redirect_back(fallback_location: home_path)
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
