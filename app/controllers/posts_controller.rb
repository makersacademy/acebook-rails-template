class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create!(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  # def show
  #   find_post
  # end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  # def find_post
  #   @post = Post.find(params[:id])
  # end
end
