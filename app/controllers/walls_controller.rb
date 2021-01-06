class WallsController < ApplicationController

  def show
    p params
    @wall = User.find_by(id: current_user.id)
    # @posts = Wall.find_by(id: current_user.id)
  end


end
