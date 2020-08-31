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
    @post = Post.create(message: post_params['message'], user: User.find(current_user.id))
    @user_post = UsersPost.create(post_id: @post.id, user_id: current_user.id)
    reload_page
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def update
    @post = Post.find(params[:id])
    if !@post.updatable? && (@post.user_id == current_user.id)
      flash[:alert] = 'Ten minutes have elapsed since the post was created. It can no longer be updated'
    elsif @post.updatable? && (@post.user_id != current_user.id)
      flash[:alert] = 'Only the owner of the post may edit the post'
    else
      @post.update(message: post_params['message'])
    end
    reload_page
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:alert] = 'Only the owner of the post may delete the post'
    elsif @post.user_id == current_user.id
      flash[:alert] = 'Post deleted'
      @post.destroy
    end
    reload_page
  end

  private

  def post_params
    params.fetch(:post, {}).permit(:message)
  end
end
