# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.where(id: params[:id]).first
    if !@post
      redirect_to root_path
    # else
    #   @post.update(@post.views+1)
    end
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    if @post.save
      redirect_to posts_url
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
    @post = Post.where(id: params[:id]).first
    if !@post
      redirect_to root_path
    end
  end

  def update
    @post = Post.where(id: params[:id]).first
    if !@post
      redirect_to root_path
    else
      if @post.update(message: params[:post][:message])
        flash[:notice] = 'Successfully updated the post!'
       redirect_to posts_url
      else
        flash[:alert] = 'Couldn’t edit the post...'
        render :edit
      end
    end
  end  

  def destroy
    @post = Post.where(id: params[:id]).first
    if !@post
      redirect_to root_path
    else
      if @post.destroy
        flash[:notice] = 'Successfully deleted the post!'
        redirect_to posts_url
      else
        flash[:alert] = 'Couldn’t delete the post...'
        redirect_to posts_url
      end
    end
  end


  def index
    @posts = Post.all
  end

  private

  def post_params
    
    params.require(:post).permit(:message)
  end
end
