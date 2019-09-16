class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    #@comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @user = User.find(@comment.user_id)
    @comment_owner = User.find(@comment.user_id)
    p @comment_owner
    @email = @comment_owner.email
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end
