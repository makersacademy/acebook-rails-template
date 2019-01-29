class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save

    # @post = Post.create(post_params)
    # require 'pry'
    # binding.pry
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def home
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
