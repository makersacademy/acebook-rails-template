class LikesController < ApplicationController
  before_action :find_likeable

  # def create
  #   @likeable.liked_by current_user
  # end
  #
  # def destroy
  #   @likeable.disliked_by current_user
  #   # current_user.dislikes @likeable
  # end

  def upvote
    @likeable.liked_by current_user
    likeable_type = params[:likeable_type].constantize
    if likeable_type == Post
      @@wall_id = Post.where(id: params[:likeable_id]).first.wall_id
    elsif likeable_type == Comment
      post_id = Comment.where(id: params[:likeable_id]).first.post_id
      @@wall_id = Post.where(id: post_id).first.wall_id
    end
      redirect_to "/#{@@wall_id}"
  end

  def downvote
    @likeable.disliked_by current_user
    likeable_type = params[:likeable_type].constantize
    if likeable_type == Post
      @@wall_id = Post.where(id: params[:likeable_id]).first.wall_id
    elsif likeable_type == Comment
      post_id = Comment.where(id: params[:likeable_id]).first.post_id
      @@wall_id = Post.where(id: post_id).first.wall_id
    end
      redirect_to "/#{@@wall_id}"
  end

  private

  def find_likeable
    @likeable_type = params[:likeable_type].camelize
    @likeable = @likeable_type.constantize.find(params[:likeable_id])
  end

end
