class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to "/#{current_user.id}"
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post.user == current_user
    redirect_to request.referer || '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # binding.pry
    @post = Post.find(params[:id])
    @post.update(post_params) if @post.user == current_user
    redirect_to "/#{@post.wall_id}"
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
