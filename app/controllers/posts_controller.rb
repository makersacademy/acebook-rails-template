# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if users_post(@post) && under_ten_mins(@post)
      if @post.update(post_params)
        redirect_to posts_url
      else
        render 'edit'
      end
    else
      redirect_to posts_url
      flash[:alert] = "Sorry you cannot edit this post"
    end
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    authenticate_user
    @posts = Post.all.reverse_order
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

  private

  def under_ten_mins(post)
    (Time.now - post.created_at) < 600
  end

  def users_post(post)
    post.user_id == current_user.id
  end

  def post_params
    params.require(:post).permit(:message)
  end

  def authenticate_user
    redirect_to '/' unless user_signed_in?
  end

end
