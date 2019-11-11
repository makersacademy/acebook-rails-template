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
  @comment = @current_post.comments.create(commentParams) do |comment|
    comment.user = current_user
  end
  if @comment.save
    flash[:notice] = "Comment successfully added"
    redirect_to posts_url
  else
    flash[:notice] = "Your comment could not be added"
    redirect_to posts_url
  end
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

    redirect_to posts_url
  end
  return if @comment
  redirect_to posts_url
end

def update
  set_comment
  if @comment.update(commentParams)
    flash[:notice] = "Successfully updated the comment"

    redirect_to posts_url
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

def commentParams
  params.require(:comment).permit(:body)
end

end
