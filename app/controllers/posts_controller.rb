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

  def update
    p post = Post.find_by(id: id_params)
    post.update(likes: (post.likes.to_i + 1 ))
    redirect_to posts_url
  end


  private

  def post_params
    params.require(:post).permit(:message)
  end

  def id_params
    p params.require(:id)
  end

end
