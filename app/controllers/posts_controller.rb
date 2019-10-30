class PostsController < ApplicationController
 # before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index

    @posts = Post.all.reverse
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "The post has been deleted."
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
