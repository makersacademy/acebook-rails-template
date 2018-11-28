class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge({ user_id: current_user.id }))
    respond_to do |format|
        format.html { redirect_back fallback_location: root_path }
        format.js
    end
  end

  private

  def comment_params
    params[:comment].permit(:text, :post_id)
  end

end
