class WallController < ApplicationController
  before_action :find_wall_owner

  def show
    @wall_id = params[:user_id]
    @posts = Post.where(wall_id: @wall_id).order("created_at DESC")
  end

  def find_wall_owner
    @wall_owner = User.find_by(id: params[:user_id])
    redirect_to '/404' if @wall_owner.blank?
    return @wall_owner
  end
end
