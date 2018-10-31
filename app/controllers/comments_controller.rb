class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    if Comment.find(params[:id]).update(comment_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :message)
  end
end
