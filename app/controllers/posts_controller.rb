class PostsController < ApplicationController

  def home
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    # replace \n with \\n
    # @post.message.gsub("\r", "\\r")
    # @post.message.gsub("\n", "\\n")
    @post.save
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
