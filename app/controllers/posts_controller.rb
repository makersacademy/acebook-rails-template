class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params(@@wall_id))
    redirect_to "/#{@post.wall_id}"
  end

  def index
    @@wall_id = params[:id]
    @posts = Post.where(wall_id: params[:id]).reverse
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to "/#{current_user.id}"
  end

  private

  def post_params(wall_id)
    params.require(:post).permit(:message).merge(user_id: current_user.id, wall_id: wall_id )
  end
end
