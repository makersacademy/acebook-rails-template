class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    #@comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    p @comment.user.email
    redirect_to posts_url
  end

  def index
    @user = User.find(@comment.user_id)
    @comment_owner = User.find(@comment.user_id)

    @email = @comment_owner.email
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end
