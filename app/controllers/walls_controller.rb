class WallsController < ApplicationController
  def new
    @user = User.find_by(id: session[:user_id])
  end


  def show
    @posts = Post.all
    # @post = Post.find_by(id: session[:user_id])
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
