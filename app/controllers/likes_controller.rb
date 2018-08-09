class LikesController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @like = Like.create(like_params)
    @like.save
    redirect_to users_path
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @likes = Like.where(post_id: params[:post_id])
  end

  private

  def like_params
    { user_id: session[:current_user_id], post_id: params[:post_id] }
  end

end
