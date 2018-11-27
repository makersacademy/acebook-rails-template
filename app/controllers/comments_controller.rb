class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    # @comment = Comment.create(comment_params.merge({user_id: current_user.id}))
    # respond_to do |format|
    #   format.html do
    #   flash[:success] = "Comment added!"
    #   redirect_to :back
    # end
    
    # format.js
    # end
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge({user_id: current_user.id}))
    respond_to do |format|
        format.html { redirect_to :back }
        format.js 
    end
  end

  private

  def comment_params
    params[:comment].permit(:text, :post_id)
  end

end
