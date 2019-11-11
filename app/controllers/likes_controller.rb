class LikesController < ApplicationController

  def new
    create(params[:post_id], params[:redirect])
  end

  def create(post_id, redirect_path)
    unless Like.find_by(post_id: post_id, user_id: session[:user_id])
      @like = Like.create(post_id: post_id, user_id: session[:user_id])
    else
      destroy(post_id, redirect_path)
    end
    path = redirect_path || '/posts'
    redirect_to path
  end

  def destroy(post_id, redirect_path)
    @like = Like.find_by(post_id: post_id, user_id: session[:user_id])
    @like.destroy
    redirect_to redirect_path || '/posts'
  end

  private

  def post_params
    params.require(:like).permit(:post_id)
  end

  def redirect_to_previous_page
    redirect = session[:path] || '/posts'
    session[:path] = nil
    redirect_to redirect
  end
end
