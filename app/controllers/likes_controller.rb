class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    unless Like.find_by(post_id: post_params["post_id"], user_id: session[:user_id])
      @like = Like.create(post_id: post_params["post_id"], user_id: session[:user_id])
    end
    redirect_path = params.require(:like).permit(:redirect_path)[:redirect_path] || '/posts'
    redirect_to redirect_path
  end

  private

  def post_params
    params.require(:like).permit(:post_id)
  end

end
