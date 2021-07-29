class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: comment_params, user: current_user)
    respond_to do |format|
      if @post.save
        format.js
        format.html { redirect_to @post }
        format.json { render 'show', status: :created, location: @post }
      end
    end
    redirect_to @post
  end

  def showComment
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def index
    @post = Post.find(params[:post_id])
  end

  def comments
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: comment_params, user: current_user)
  end

  private

  def comment_params
    params.require(:comment).permit(:body) [:body]
  end
end
