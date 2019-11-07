class PostsController < ApplicationController
  def new
    # @@wall_id = params[:id]
    @post = Post.new
  end

  def create
    # @@wall_id = params[:id]
    # $wall_id = params[:id]
    @post = Post.create(post_params(@@wall_id))
    # redirect_to posts_url
    redirect_to "/users/#{current_user.id}"
  end

  def index
    @@wall_id = params[:id]
    @posts = Post.where(wall_id: params[:id])
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_url
  end

  private

  def post_params(wall_id)
    params.require(:post).permit(:message).merge(user_id: current_user.id, wall_id: wall_id )
  end
end
