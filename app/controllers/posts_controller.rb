class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # create post with the message and the wall id and the user id
    redirect_to "/#{current_user.id}"
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
