class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    session[:return_to] = "#{request.referer}"
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to session[:return_to]
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_name: current_user.name)
  end

  def authenticate_user!
    super
  end
end
