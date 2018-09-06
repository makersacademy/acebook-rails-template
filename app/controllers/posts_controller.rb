# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]

  def new
    session[:return_to] = request.referer.to_s
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_name = current_user.name
    respond_to do |format|
      if @post.save
        format.html { redirect_to session[:return_to], notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to session[:return_to], notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    session[:return_to] = request.referer.to_s
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to session[:return_to], notice: 'Post was successfully destroyed.' }
    end
  end

  def index
    @posts = Post.order(created_at: :desc).all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authenticate_user!
    super
  end
end
