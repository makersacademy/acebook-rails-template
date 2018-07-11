class CommentsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  before_action :validate_delete_permission,   only: :destroy

  def create
    post = Post.find(comment_params[:post_id])
    content = params[:comment][:content]
    @comment = post.comments.build(content: content, user: current_user)
    @comment.save
    # flash[:success] = "Comment created!"
    redirect_to root_path
  end

  def destroy
    @comment_destroy.destroy
    # flash[:success] = "Comment deleted"
    redirect_to root_path
  end


  private

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

  def correct_comment_owner
    comment = current_user.comments.find_by(id: params[:id])
    comment.nil?
   end

   def correct_post_owner
     comment = Comment.find(params[:id])
     post = Post.find_by(id: comment.post_id)
     post.user_id != current_user.id
   end

   def validate_delete_permission
    if correct_comment_owner && correct_post_owner
      redirect_to root_url
    else
      @comment_destroy = Comment.find(params[:id])
    end
  end
end
