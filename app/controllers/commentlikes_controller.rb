# frozen_string_literal: true

class CommentlikesController < ApplicationController
  skip_before_action :authenticated_user
  before_action :find_comment
  before_action :find_commentlike, only: [:destroy]

  def create
    @comment.commentlikes.create(user_id: current_user.id)
    redirect_to session[:url]
  end

  def destroy
    if !already_liked?
      flash.now.alert = 'Apologies, you cannot unlike this'
    else
      @commentlike.destroy
    end
    redirect_to session[:url]
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def already_liked?
    Commentlike.where(user_id: current_user.id, comment_id: params[:comment_id]).exists?
  end

  def find_commentlike
    @commentlike = @comment.commentlikes.find(params[:id])
  end
end
