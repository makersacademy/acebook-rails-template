# frozen_string_literal: true

class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  
  end

  def create
    @user = User.find_by_id(session[:current_user_id])
    binding.pry
    #@post = @user.posts.create(post_params)
    p @user
    redirect_to @user
  end

 

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
