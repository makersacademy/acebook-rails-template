class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    p params
    @post = Post.find(params[:post_id])
    @pcomment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
