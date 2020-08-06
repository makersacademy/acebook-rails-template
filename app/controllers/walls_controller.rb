class WallsController < ApplicationController
  def index
    p current_user.id
    @wall = Wall.find(current_user.id)
    @posts = @wall.posts.all
  end
end
