class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params.merge({user_id: current_user.id}))
    redirect_to root_url

    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(comment_params)
    # @comment.user = current_user
    # redirect_to post_path(@post)
    # @comment.save
    
  end

  private

  def comment_params
    params.permit(:text, :post_id)
  end

end
