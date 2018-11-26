class CommentsController < ApplicationController

  def new
    puts 1
    @comment = Comment.new
  end

  def create
    puts 2
    @comment = Comment.create(comment_params.merge({user_id: current_user.id}))
    redirect_to posts_url
  end

  private

  def comment_params
    puts 3
    puts params
    puts params.comment
    params.require(:comment).permit(:comment_text, :post_id)
  end

end
