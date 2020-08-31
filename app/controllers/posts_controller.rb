require_relative '../helpers/application_helper'

class PostsController < ApplicationController
  before_action :require_login
  include ApplicationHelper

  def show
  end

  def new
    @post = Post.new
  end

  def create
    return if post_params['message'].empty?

    @post = Post.create(message: post_params['message'], user: User.find(current_user.id))
    @user_post = UsersPost.create(post_id: @post.id, user_id: current_user.id)
    reload_page
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def update
    return if post_params['message'].empty?

    @post = Post.find(params[:id])
    if !@post.updatable? && (@post.user_id == current_user.id)
      flash[:alert] = "#{@post.update_time} seconds have elapsed since the post was created. It can no longer be updated"
    elsif @post.updatable? && (@post.user_id != current_user.id)
      flash[:alert] = 'Only the owner of the post may edit the post'
    elsif @post.updatable? && (@post.user_id == current_user.id)
      @post.update(message: post_params['message'])
    end
    reload_page
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      flash[:alert] = 'Post deleted'
      UsersPost.find(params[:id]).destroy
      @post.destroy
    else
      flash[:alert] = 'Only the owner of the post may delete the post'
    end
    reload_page
  end

  private

  def post_params
    params.fetch(:post, {}).permit(:message)
  end
end
