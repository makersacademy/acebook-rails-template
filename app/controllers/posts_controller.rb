class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:id])
    @post = @user.posts.create(post_params)
    redirect_to article_path(@user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
