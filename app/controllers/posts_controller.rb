class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def comment
    @posts = Post.all
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.create(message: post_params, user: current_user)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all
    @comment = Comment.new
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save!
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)[:message]
  end
end
