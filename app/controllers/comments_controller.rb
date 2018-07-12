class CommentsController < ApplicationController

before_action :find_comment, only: [:edit, :update, :show, :destroy]

  def index
    @comments = Comment.all
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to user_posts_path
    else
      flash.now[:danger] = "error"
    end
  end

  def edit
  end

  def update
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Successfully updated post"
      redirect_to user_posts_path(user)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  def show
  end

  def destroy
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    if @comment.destroy
      flash[:notice] = "Successfully deleted comment"
      redirect_to user_posts_path(user)
    else
      flash[:alert] = "Error deleting comment!"
    end
  end

  def new
    @comment = Comment.new
  end

  private

    def comment_params
    params.require(:comment).permit(:comment)
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
end
