class LikesController < ApplicationController

  def create
    @user = User.find(session[:current_user_id])
    @post = Post.find(params[:id])
    @like = Like.create(like_params)
    redirect_to user_path(@user)
  end
end

  private

  def like_params
    { user_id: session[:current_user_id], post_id: params[:id] }
  end
