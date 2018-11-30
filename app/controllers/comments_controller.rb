class CommentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]


  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(post_comment_params)
    json_response(@comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    json_response(nil)
  end

  def edit
    @comment = Comment.find(params[:id])
    json_response(@comment)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.editable? && @comment.user.id == current_user.id
      @comment.update(comment: params[:comment][:comment])
      json_response(@comment)
    else
      json_response(@comment, 401)
    end
  end

  def like
    @likeable = Comment.find(params[:id])
    like = Like.find_by({likeable: @likeable, user: current_user})
    if like
      like.destroy
    else
      Like.create(likeable: Comment.find(params[:id]), user: current_user)
    end
    respond_to do |format|
      format.html do
        redirect_to posts_url
      end
      format.js
    end
  end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
      .merge({post_id: params.require(:post_id), user_id: current_user.id})
  end

end
