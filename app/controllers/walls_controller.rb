class WallsController < ApplicationController
  def index
    @wall = Wall.find(current_user.id)
    @posts = @wall.post.all
  end
end
