# frozen_string_literal: true
require_relative '../models/post'

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)
    redirection(@post)
  end

  def index
    authenticate_user
    @posts = Post.show
  end

  def edit
    @post = Post.find(params[:id])
    if users_post(@post) && Post.under_ten_mins(@post)
      render 'edit'
    else
      redirection(@post)
      flash[:alert] = "Sorry you cannot edit this post"
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirection(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    if users_post(@post)
      @post.destroy
      redirection(@post)
    else
      redirection(@post)
      flash[:alert] = "Sorry you cannot delete another User\'s posts"
    end
  end

  private

  def redirection(post)
    if users_post(post)
      redirect_to "/#{post.wall_id}"
    else 
      redirect_to '/'
    end 
  end

  def users_post(post)
    post.user_id == current_user.id
  end

  def post_params
    params.require(:post).permit(:message, :wall_id)
  end

  def authenticate_user
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
