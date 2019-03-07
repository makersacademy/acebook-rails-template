class WallsController < ApplicationController
  def index
    @walls = User.all
  end

  def show
    @posts = Post.all.where(wall_user_id: params[:id]).order("updated_at DESC")
  end
end
