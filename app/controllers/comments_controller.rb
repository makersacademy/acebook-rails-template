class CommentsController < ApplicationController

  def new
  end

  def show
  
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: comment_params["body"], user_id: session[:user_id], post_id: comment_params["post_id"])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if !authenticated?
      redirect_to post_path(@post)
      flash[:danger] = 'You can only delete your own comments'
    else
      @comment.destroy
      redirect_to post_path(@post)
    end
  end

private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

end
