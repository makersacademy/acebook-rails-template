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
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:post_id])
    @comment.destroy

    redirect_to posts_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
