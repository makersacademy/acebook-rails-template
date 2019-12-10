class Api::LikesController < ApplicationController

  def index
    @likes = Post.find(params[:post_id]).likes
    respond_to do |format|
      format.json { render :json => @likes }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.json { render :json => @like }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @likes = @post.likes.select { |like| like.user_id == current_user.id }
    @like = @likes.first
    respond_to do |format|
      format.json { render :json => @like.destroy }
    end
  end

end
