# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save
    @post.errors.full_messages

    redirect_to posts_path
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def index
    @username = User.find_by(id:  session[:user_id])
    #   @user_name = session[:user_name]
    @posts = Post.all.order(created_at: :desc)
  end


  def destroy

    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(message: params[:post][:message])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
