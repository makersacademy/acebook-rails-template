class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
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
    # @post.update(content: params[:post][:content])
    @post.update(update_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def update_params
    params.require(:post).permit(:content)
  end
end
