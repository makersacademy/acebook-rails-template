class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => 'index'
    else
      flash.now[:notice] = "Error saving your new note, please try again!"
      redirect_to posts_url
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order("updated_at DESC")
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
