class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def update
    p post = Post.find_by(id: id_params)
    p post.increment(:likes)
    post.save
    redirect_to posts_url
  end

  
  private

  def post_params
    params.require(:post).permit(:message)
  end

  def id_params
    params.require(:id)
  end

end
