class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to '/'
  end
end
