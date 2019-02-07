class CommentsController < ApplicationController
  before_action :find_post

  def index
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to posts_url, notice: "Your comment has been created!"
    else
      redirect_to posts_url, notice: "Your new post couldn't be created!"
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end

end
