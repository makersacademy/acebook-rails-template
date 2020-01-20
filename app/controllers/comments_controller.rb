class CommentsController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :fetch_post

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comment.build
  end

  def create
    @comment = @post.comment.build(comment_params)
    @comment.user_id = session[:user_id]
    if @pcomment.save
      redirect_to posts_url
    else
      render :new
    end
  end

  private

  def fetch_post
    @post = Post.find_by_id(params[post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

end
