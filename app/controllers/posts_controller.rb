class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :store_previous_path, only: [:new]

  def new
    @post = Post.new
  
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id # Set the user_id attribute
    username = current_user.username # Get the username

    if @post.save
      redirect_to session.delete(:previous_path) || posts_path
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
