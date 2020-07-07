class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: params[:comment][:body], user_id: current_user.id)
    redirect_to posts_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_url
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    p params
    Comment.update(params[:id], :body => params[:comment][:body])
    redirect_to posts_url
  end
end
