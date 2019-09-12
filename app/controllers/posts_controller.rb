# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    validate_user
      @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    validate_user
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    validate_user
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def validate_user

    @post = Post.find(params[:id]) || current_user.posts.find(params[:id])
    @user_id_from_post = @post.user_id
    if @user_id_from_post != current_user.id
      flash[:notice] = "That's not your post"
      redirect_to posts_path and return
    end
  end

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
