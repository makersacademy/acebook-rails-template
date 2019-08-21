class WallsController < ApplicationController
  def new
  end


  def show
    @user = User.find(params[:id])
    @posts = Post.all
    if !session[:user_id]
      redirect_to '/login'
    end
  end


    def create

    end


  def index
    @posts = Post.all
    if !session[:user_id]
      redirect_to '/login'
    end
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
