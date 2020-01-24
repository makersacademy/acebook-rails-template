class CommentsController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :fetch_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = session[:user_id]
    @comment.save
    respond_to do |format|
      format.js { render 'comments/create.js' }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.update(comment_params)
    respond_to do |format|
      format.js
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render "comments/destroy.js" }
      format.html
    end
  end

  private

  def fetch_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

end
