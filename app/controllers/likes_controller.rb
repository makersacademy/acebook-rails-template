class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    @like.save
    redirect_to posts_url
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    Like.find_by(post_id: params[:id], user_id: current_user.id).delete
    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find_by(id: params[:like_id])
    end
end
