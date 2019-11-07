class PostsController < ApplicationController
  def new
    p params[:user_id]
    # p @wall_id = post_params[:user_id]
    @post = Post.new
  end

  def create
    # @wall_id = params[:user_id]
    @post = Post.create(post_params)
    redirect_to posts_url
    # p @wall_id
  end

  def index
    # p @wall_id = params[:id]
    @posts = Post.all
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id, wall_id: current_user.id )
  end
end
