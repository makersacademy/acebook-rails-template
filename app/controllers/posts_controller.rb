# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]
  before_action :correct_user, only: %i[edit update destroy]

  def correct_user
    redirect_to posts_path unless current_user.id == @post.user.id
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
