require_relative '../../lib/modules/date_format.rb'

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge({user_id: current_user.id, id: params[:id]}))
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params.merge({user_id: current_user.id}))
    redirect_to posts_url
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:wall_id, :message)
  end
end
