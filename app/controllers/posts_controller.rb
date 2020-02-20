# frozen_string_literal: true
require_relative '../models/post'

class PostsController < ApplicationController
  def new
    # if params[:wall_id] != nil
    #   @user = User.find(params[:wall_id])
    # end
    @post = Post.new

  end

  def edit
    @post = Post.find(params[:id])
    if users_post(@post) && Post.under_ten_mins(@post)
      render 'edit'
    else
      redirect_to posts_url
      flash[:alert] = "Sorry you cannot edit this post"
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    authenticate_user
    @posts = []
    Post.all.reverse_order.each do |post|
      if (post.wall_id == nil) || (post.user_id == post.wall_id)
        @posts.append(post)
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if users_post(@post)
      @post.destroy
      redirect_to posts_url
    else
      redirect_to posts_url
      flash[:alert] = "Sorry you cannot delete another User\'s posts"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

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
