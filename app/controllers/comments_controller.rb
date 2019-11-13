class CommentsController < ApplicationController

  before_action :find_post, only: [:create, :edit, :update]
  before_action :find_comment, only: [:edit, :update]

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @current_post.comments.create(comment_params) do |comment|
      comment.user = current_user
    end
    if @comment.save
      flash[:notice] = "Comment successfully added"
    else
      flash[:notice] = "Your comment could not be added"
    end
    redirect_to "/users/#{@current_post.wall_id}"
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    set_comment
    if not_curr_user?
      flash[:alert] = "Sorry! You can't edit someone else's comment."
    elsif @comment.not_editable?
      flash[:alert] = "10 minutes exceeded: you can no longer edit the comment."

      redirect_to "/users/#{@current_post.wall_id}"
    end
    return if @comment

    redirect_to "/users/#{@current_post.wall_id}"
  end

  def update
    set_comment
    if @comment.update(comment_params)
      flash[:notice] = "Successfully updated the comment"

      redirect_to "/users/#{@current_post.wall_id}"
    else
      flash[:alert] = "Couldn't update the comment"
      render :edit
    end
  end

  def destroy
    set_comment
    if not_curr_user?
      flash[:alert] = "Sorry! You can't delete someone else's comment."
    elsif curr_user? && @comment.can_destroy?
      flash[:notice] = 'Successfully deleted the comment!'
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    # Redirect to stay on current wall
    redirect_to posts_url
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    # Redirect to stay on current wall
    redirect_to posts_url
  end

private

  def set_comment
    @comment = Comment.where(id: params[:id]).first
  end

  def find_post
    @current_post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @current_post.comments.find(params[:id])
  end

  def curr_user?
    @comment.user

    redirect_to posts_url
  end

  def not_curr_user?
    return unless current_user != @comment.user

    redirect_to posts_url
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
