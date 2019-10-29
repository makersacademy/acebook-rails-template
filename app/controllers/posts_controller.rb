class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
      if !current_user
          redirect_to log_in
          else
    @posts = Post.all
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
