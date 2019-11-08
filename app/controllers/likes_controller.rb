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
    @post = Post.where(id: params[:post_id])
    @@wall_id = @post.first.wall_id
    redirect_to "/#{@@wall_id}"
  end

  def downvote
    @likeable.disliked_by current_user
    redirect_to "/#{@@wall_id}"
  end

  private

  def find_likeable
    @likeable_type = params[:likeable_type].camelize
    @likeable = @likeable_type.constantize.find(params[:likeable_id])
  end

end
