class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: current_user.id)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(message: post_params)
  end

  private

  def post_params
    params.require(:post).require(:message)
  end

  # def update_params
  #   params.require(:updated_post).require(:message)
  # end

end
