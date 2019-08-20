class WallsController < ApplicationController
  def index
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: session[:user_id])
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
