class PostsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    @post = Post.create(post_params)

    @post.save

    redirect_to posts_path

    # render plain: params[:post].inspect
  end

  def index
    @posts = Post.all

  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  private

  def post_params

    params.require(:post).permit(:message)
  end
end
