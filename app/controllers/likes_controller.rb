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
  end

  def downvote
    @likeable.disliked_by current_user
  end

  private

  def find_likeable
    p params[:likeable_type]
    @likeable_type = params[:likeable_type].camelize
    @likeable = @likeable_type.constantize.find(params[:likeable_id])
  end

end
