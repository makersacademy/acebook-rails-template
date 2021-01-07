class PostsController < ApplicationController

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully burnt in hell' }
      format.json { head :no_content }
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
