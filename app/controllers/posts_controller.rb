# frozen_string_literal: true

class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
    @posts = User.post.all
  
  end

  def create
    @post.user = current_user 
    @post = current_user.Post.create(post_params)
    redirect_to '/poststo'
  end

 

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
