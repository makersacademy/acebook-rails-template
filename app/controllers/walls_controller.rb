class WallsController < ApplicationController

  def show
    @wall = User.find_by(id: current_user.id)
    # @posts = Wall.find_by(id: current_user.id)
  end


end
