class PostsController < ApplicationController

  def new
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(posts_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    p posts_params
    @post = Post.find(params[:id])
    @post.update(posts_params)

    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @user = User.find(session[:user_id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

private

  def posts_params
    params.require(:post).permit(:message)
  end


end
