class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    Post.create({user_id: current_user.id, message: params[:post][:message], image: params[:post][:image]})
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

end
