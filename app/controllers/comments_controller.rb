class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end  

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(comment_params)
    @comment = Comment.new({post_id: params[:id], commentor_id: session[:current_user], content: params[:comment], time: Time.now})
    @comment.save
    redirect_to "/home"
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroyflad[:success] = 'Comment was successfully erased from existence'
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end