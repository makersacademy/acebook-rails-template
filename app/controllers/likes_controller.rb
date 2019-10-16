class LikesController < ApplicationController

  def update
    if set_like
      delete_like
    else
      create_like
    end
  end
  
  private

  def delete_like
    @like = set_like
    @like.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def create_like
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
    if @like.save
      redirect_to posts_path
    else
      flash[:notice] = "Like failed"
    end
  end

  def set_like
    Like.where(user_id: current_user.id, post_id: params[:post_id])['id'.to_i]
  end
end
