class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: params[:comment][:body], user_id: current_user.id)
    redirect_to posts_url
  end
end
