class CommentsController < ApplicationController

  before_action :set_post

  def create
    @user = User.find(session[:user_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id
    redirect_to posts_url
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to root_path
end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
