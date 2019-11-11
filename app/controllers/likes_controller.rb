class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token


  def new
    create(params[:post_id])
  end

  def create(post_id)
    unless Like.find_by(post_id: post_id, user_id: session[:user_id])
      @like = Like.create(post_id: post_id, user_id: session[:user_id])
    else
      destroy(post_id)
    end
  end

  def destroy(post_id)
    @like = Like.find_by(post_id: post_id, user_id: session[:user_id])
    @like.destroy
  end

  def postinfo
    session[:last_liked_post] = params[:post_id]
  end

  def getinfo
    @post = Post.find(session[:last_liked_post])
    session[:last_liked_post] = nil
    respond_to do |format|
      format.json { render json: { likecount: @post.likes.length, likedby: @post.users.map { |x| x.username }.join(", ") } }
    end
  end
end
