# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
      @post = Post.find(params[:id])
   end

  def update
    @post = Post.find(params[:id])

      if @post.update_attributes(post_params)
         redirect_to :action => 'index', :id => @post
      else
         # @subjects = Subject.all
         render :action => 'edit'
      end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
