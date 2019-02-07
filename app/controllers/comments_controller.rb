class CommentsController < ApplicationController
  before_action :find_post

  def index
  end

  def create
    @user = current_user
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    create_comment
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end

  def create_comment
    if @comment.save
      redirect_to user_path(session[:current_wall]), 
      notice: "Your comment has been created!"
    else
      redirect_to user_path(session[:current_wall]), 
      notice: "Your new post couldn't be created!"
    end
  end

end
