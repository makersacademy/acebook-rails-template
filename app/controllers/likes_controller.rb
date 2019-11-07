class LikesController < ApplicationController
  before_action :find_likable

  def create
    @likable.liked_by current_user
  end

  def destroy
    @likable.disliked_by current_user
  end

  private

  def find_likable
    @likeable_type = params[:likeable_type].camelize
    @likeable = @likeable_type.constantize.find(params[:likable_id])
  end
  
end
