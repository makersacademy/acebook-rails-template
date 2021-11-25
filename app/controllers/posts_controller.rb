class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def update(id)
    post = Post.find_by(id: id)
    post.update(likes: (post.likes + 1 ))
    redirect_to posts_url
  end

  
  private

  def post_params
    params.require(:post).permit(:message)
  end
end
