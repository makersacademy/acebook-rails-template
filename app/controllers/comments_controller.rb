class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.update(update_comment_params)
      redirect_to('/posts/' + update_comment_params[:post_id])
    else
      render 'commentsform'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :post_id)
  end

  def update_comment_params
    params.permit(:commenter, :body, :post_id)
  end
end
