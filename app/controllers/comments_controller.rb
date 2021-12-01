class CommentsController < ApplicationController
  
  def new 
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment: comments_params["comment"], post_id: id_params, user_id: user_params)
    redirect_to posts_url
  end

  def index
    @comment = Comment.new
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
  end

  def id_params
    params.require(:post_id)
  end

  def user_params
    params.require(:current_user_id)
  end


end
