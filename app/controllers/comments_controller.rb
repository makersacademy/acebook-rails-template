class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    post.comments.create!(comment_params.merge(user_id: current_user.id))
    flash[:notice] = "Salmon had to say it!"
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "You krill me!"
      redirect_to posts_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
