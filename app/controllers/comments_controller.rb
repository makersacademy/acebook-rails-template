class CommentsController < ApplicationController
  before_action :require_login
  include ApplicationHelper

  def show; end

  # TODO: not displaying newest first
  def index
    @comments = Comment.order(created_at: :desc)
  end


  def update
    return if comment_params['message'].empty?

    @comment = Comment.find(params['id'])
    return 'INVALID ID' if @comment.nil?

    if !@comment.updatable? && (@comment.poster.to_i == current_user.id)
      flash[:alert] = "#{@comment.update_time} seconds have elapsed since the comment was created. It can no longer be updated"
    elsif @comment.updatable? && (@comment.poster.to_i != current_user.id)
      flash[:alert] = 'Only the owner of the comment may edit the comment'
    elsif @comment.updatable? && (@comment.poster.to_i == current_user.id)
      @comment.update(message: comment_params['message'])
    end
    reload_page
  end

  def create
    @comment = Comment.create(poster: current_user.id,
                              message: comment_params['message'],
                              post: Post.find(comment_params['post_id']))
    reload_page
  end


  def destroy
    @comment = Comment.find(params[:id])
    if @comment.poster.to_i == current_user.id
      flash[:alert] = 'comment deleted'
      @comment.destroy
    else
      flash[:alert] = 'Only the owner of the comment may delete the comment'
    end
    reload_page
  end

  private

  def comment_params
    params.fetch(:comment, {}).permit(:message).merge(post_id: params['post_id'])
  end

end
