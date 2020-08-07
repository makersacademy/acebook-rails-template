class WallsController < ApplicationController
  def index
    @wall = Wall.find(current_user.id)
    @post = Post.new
    @posts = @wall.posts.all
    @walls = Wall.all
  end

  def show
    @wall = Wall.find(params[:id])
    @post = Post.new
    @posts = @wall.posts.all
    @walls = Wall.all
  end

  def create
    @wall = Wall.find(params[:wall_id])
    p post_params
    @post = @wall.posts.create(wall_params)
    @post.wall_id = 100
    @post.user_id = current_user.id
    p @post.wall_id
    @post.save
    redirect_to '/posts'
  end

  def allwalls
    @walls = Wall.all
  end

  private
  def wall_params
      params.require(:post).permit(:message)
  end
end
