require 'pry'

class CommentsController < ApplicationController
  # before_action :require_login
  # before_action :find_commentable, only: :create
  # respond_to? :js

  def index
    @comments = Comment.all
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = post.id
    if @comment.save
      redirect_to user_posts_path(post)
    else
      flash.now[:danger] = "error"
    end
  end

  def new
    @comment = Comment.new
  end

  private

    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
