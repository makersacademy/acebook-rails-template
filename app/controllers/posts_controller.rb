# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.create(post_params)
    @post.user_name = current_user.name
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def edit; end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  def index
    @posts = Post.order(created_at: :desc).all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def authenticate_user!
    if current_user
      super
    elsif request.original_fullpath != root_path
      redirect_to root_path, notice: 'Please Login to view that page!'
    end
  end
end
