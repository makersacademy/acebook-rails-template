# frozen_string_literal: true

require 'pry'
class PostsController < ApplicationController
  before_action :can_edit, only: %i[edit update destroy]
  before_action :check_time!, only: %i[edit update]

  def index
    @posts = Post.where(recipient_id: params[:user_id]).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.new
    @recipient_id = params[:user_id]
  end

  def create
    @post = Post.create(post_params.merge(user_id: session[:user_id]))
    redirect_to user_posts_path(post_params[:recipient_id])
  end

  def destroy
    @post = Post.find(params[:id])
    @recipient_id = @post.recipient_id
    @post.destroy

    redirect_to user_posts_path(@recipient_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_posts_path(post_params[:recipient_id])
  end

  private

  def post_params
    params.require(:post).permit(:message, :recipient_id)
  end

  def can_edit
    @post = Post.find(params[:id])
    unless @post && current_user && current_user.can_edit?(@post)
      redirect_to user_post_path(current_user)
    end
  end

  def check_time!
    if Time.now > @post.created_at + 10.minutes
      flash[:created_at] =
        'Post can only be edited 10 min after it has been created'
      redirect_to user_posts_path(current_user)
    end
  end
end
