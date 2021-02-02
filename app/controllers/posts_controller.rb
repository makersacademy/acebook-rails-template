class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create( {:user_id => '1', :content => post_params["content"]} )
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
