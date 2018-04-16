class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  private
  def post_params
    params.require(:post).permit(:message)
  end
end
