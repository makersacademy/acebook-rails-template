class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def edit
    post
  end

  def show
    @posts = Post.all.reverse
    render 'index'
    flash[:success] = "Post updated!"
  end

  def destroy
    post.destroy
    flash[:success] = "Post successfully deleted."
    redirect_to root_url
  end

  def update
    if post.update_attributes(post_params)
      flash[:success] = "Post updated!"
      redirect_to post
    else
      render 'edit'
    end
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
