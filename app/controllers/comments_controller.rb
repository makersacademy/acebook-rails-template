class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(post_comment_params.merge({user_id: current_user.id, post_id: params[:post_id]}))
    redirect_to posts_url
  end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end

end
