# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
    @maximum_length = Post.validators_on(:message).first.options[:maximum]
  end

  def create
    if post_params[:message].length > 100
      flash[:error] = 'Your post is too long, this is not medium.'
      redirect_to(new_post_path) && return
    end
    Post.create(post_params)
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
    
  end

  def index
    @posts = Post.all
  end

  def edit
    find_post
    if @user_id_from_post != current_user.id
      flash[:error] = "That's not your post!"
      redirect_to posts_path
    else
      @post = Post.find(params[:id])
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    find_post
    if @user_id_from_post != current_user.id
      flash[:error] = "That's not your post!"
      redirect_to posts_path
    else
      @post = current_user.posts.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    find_post
    if @user_id_from_post != current_user.id
      flash[:error] = "That's not your post!"
      redirect_to posts_path
    else
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
    @user_id_from_post = @post.user_id
  end
end
