class CommentsController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :fetch_post

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = session[:user_id]
    if @comment.save
      redirect_to post_comments_path(@post)
    else
      render :new
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
