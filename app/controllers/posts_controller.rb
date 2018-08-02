class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @posts = Post.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @username = current_user.username
  end

  def edit
  @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path, :notice => 'Your post has been updated'
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :created_at)
  end
end
