class WallsController < ApplicationController
  def index
    p current_user.id
    @wall = Wall.find(current_user.id)
    @post = Post.new
    @posts = @wall.posts.all
    @walls = Wall.all
    p 'Wall id'
    p @wall.id
  end

  def show
    @wall = Wall.find(params[:id])
    @post = Post.new
    @posts = @wall.posts.all
    @walls = Wall.all
  end
end
