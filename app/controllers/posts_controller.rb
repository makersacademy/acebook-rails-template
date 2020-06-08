class PostsController < ApplicationController
  def new
    @post = new_post
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    @post.save
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def index
    @new_post = new_post
    @posts = Post.all
    @user = User.find_by(id: session[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def new_post
    Post.new
  end
end
