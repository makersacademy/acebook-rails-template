class CommentsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    post = Post.find(comment_params[:post_id])
    content = params[:comment][:content]
    @comment = post.comments.build(content: content, user: current_user)
    @comment.save
    flash[:success] = "Comment created!"
    redirect_to root_path
  end

  def destroy
    @comment_destroy.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_path
  end


  private

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

  def correct_user
    @comment_destroy = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment_destroy.nil?
   end
end
