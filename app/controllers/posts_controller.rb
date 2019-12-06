class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, only: [:edit, :update, :destroy]



  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def update
    @post =  Post.find(params[:id])

    @post.update(post_params)
    redirect_to posts_url

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
