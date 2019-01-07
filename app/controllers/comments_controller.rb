class CommentsController < ApplicationController

  def create
    @post = Post.find(params['post_id'])
    @post.comments.create(comment_params.merge(user_id: current_user.id))
    p params['post_id']
    redirect_to post_path(params['post_id'])
  end

  private

  def comment_params
    params.require(:comment)
  end

end
