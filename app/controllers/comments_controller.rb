class CommentsController < ApplicationController
  skip_before_action :authenticated_user

  def index
  end

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.create(comment_params)
   @comment.user_id = current_user.id
   @comment.save
   redirect_back(fallback_location: home_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
