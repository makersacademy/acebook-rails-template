class Api::LikesController < ApplicationController

  def index
    @likes = Post.find(params[:post_id]).likes
    respond_to do |format|
      format.json { render :json => @likes }
    end
  end

end
