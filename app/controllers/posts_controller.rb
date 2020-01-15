class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order("updated_at DESC")
  end

  def update(user_id, text)
    post = Post.find_by(id: "#{user_id}")
    post.update(messege: "#{text}") 
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
