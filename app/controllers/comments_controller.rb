class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to posts_url
    flash[:alert] = "Comment posted successfully"
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])

    if users_own(@comment) && Comment.under_ten_mins(@comment)
      render 'edit'
    else
      redirect_to posts_url
      flash[:alert] = "Sorry you cannot edit this comment"
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to posts_url
    flash[:alert] = "Comment updated successfully"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if users_own(@comment)
      @comment.destroy
      redirect_to posts_url
      flash[:alert] = "Comment deleted successfully"
    else
      redirect_to posts_url
      flash[:alert] = "Sorry you cannot delete this comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def users_own(comment)
    comment.user_id == current_user.id
  end
end