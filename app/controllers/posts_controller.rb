# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :require_login, only: :index

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user

    respond_to do |format|
       if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        #format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

    # redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to action: 'index', id: @post
    else
      # @subjects = Subject.all
      render action: 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :photo)
  end
end
