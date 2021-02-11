class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      redirect_to posts_url
    else
      redirect_to new_post_path(errors: @post.errors.messages)
    end

  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path, notice: 'Your post was deleted successfully'
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :title, :image)
  end
end
