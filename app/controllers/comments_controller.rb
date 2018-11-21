class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(post_comment_params.merge({user_id: current_user.id}))
    redirect_to posts_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  def edit
    @post = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.editable?
      @comment.update(comment: params[:post][:comment])
    else
      flash[:danger] = "fuck off, this is not yours!"
    end
    redirect_to posts_url
  end

  private

  def post_comment_params
    params.require(:comment).permit(:message)
  end

end
