class LikesController < ApplicationController
  before_action :find_likeable

  def upvote
    @likeable.liked_by current_user
    likeable_type = params[:likeable_type].constantize
    wall_id = get_wall_id(likeable_type)
    # if likeable_type == Post
    #   @@wall_id = Post.where(id: params[:likeable_id]).first.wall_id
    # elsif likeable_type == Comment
    #   @@wall_id = Comment.where(id: params[:likeable_id]).first.post.wall_id
    # end
    redirect_to "/#{wall_id}"
  end

  def downvote
    @likeable.disliked_by current_user
    likeable_type = params[:likeable_type].constantize
    wall_id = get_wall_id(likeable_type)
    # if likeable_type == Post
    #   @@wall_id = Post.where(id: params[:likeable_id]).first.wall_id
    # elsif likeable_type == Comment
    #   @@wall_id = Comment.where(id: params[:likeable_id]).first.post.wall_id
    # end
    redirect_to "/#{wall_id}"
  end

  private

  def get_wall_id(likeable_type)
    return Post.where(id: params[:likeable_id]).first.wall_id if likeable_type == Post

    return Comment.where(id: params[:likeable_id]).first.post.wall_id if likeable_type == Comment
  end

  def find_likeable
    @likeable_type = params[:likeable_type].camelize
    @likeable = @likeable_type.constantize.find(params[:likeable_id])
  end

end
