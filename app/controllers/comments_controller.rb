class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params.merge({user_id: current_user.id}))
    redirect_to posts_url
  end

  private

  def comment_params
    params.permit(:text, :post_id)
  end

end
