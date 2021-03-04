# frozen_string_literal: true

class PostsController < ApplicationController
  # Before action calls the login_required method from application controller,
  # to create a post you must be signed in
  before_action :login_required, only: [:new, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    if Current.user
      @post = Post.new
    else
      flash[:alert] = "Please log in."
    end
  end

  def create
    @post = Current.user.posts.new(post_params)
    @post.save
    if @post.save
      redirect_to root_path, notice: 'Post successfully created'
      return
    else
      flash[:alert] = "Post message is blank, try again."
      render :new
    end
  end

  def update
    if @post.update(post_params)
        redirect_to root_path, notice: 'Post successfully updated'
        return
    else
        render :edit
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post has been deleted'
  end

  def edit

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def set_post
    @post = Current.user.posts.find(params[:id])
  end
end
