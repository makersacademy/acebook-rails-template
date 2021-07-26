class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all
    @user = User.new
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
