class WallsController < ApplicationController
  def new
    @post = Post.new
  end


  def show
    @post = Post.find_by(id: session[:user_id])
  end


    def create

    end


  def index
    @posts = Post.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private

  def post_params
    params.require(:post).permit(:message)
  end

  def current_post
    @post = Post.find(params[:id])
  end
end
