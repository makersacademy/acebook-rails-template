class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if post_params[:message] == "" && post_params[:image] == nil
      redirect_to new_post_url, notice: 'Cannot create an empty post.'
    else
      @post = Post.create(post_params)
      redirect_to posts_url
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
