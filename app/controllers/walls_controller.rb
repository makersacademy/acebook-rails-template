class WallsController < ApplicationController
  def index
    @post = Post.new
  end

  def show
    p @post = Post.find_by(id: params[:id])
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
