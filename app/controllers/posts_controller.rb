# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  def update
    @current_user = current_user
    @post = @current_user.posts.find(params[:id])
   
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def show
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)
    redirect_to posts_url
  end



  def index
    authenticate_user
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def authenticate_user
    redirect_to '/' unless user_signed_in?
  end


end

