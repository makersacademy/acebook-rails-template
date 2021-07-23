class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    params.inspect
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end


  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save!
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.inspect
    params.require(:post).permit(:message, :image)
  end
end
