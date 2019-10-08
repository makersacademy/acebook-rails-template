class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # puts post_params['message'].encode('utf-8')
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index

    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
