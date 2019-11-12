# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create

    @post = Post.new(post_params(@@wall_id)) do |post|
      post.user = current_user
    end

    if @post.save
      p "hello"
      p @post
      redirect_to "/users/#{@post.wall_id}"
    # else
    #   redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit 
    @previous_wall_id = params['previous_wall_id']

    @post = Post.where(id: params[:id]).first
    if current_user != @post.user
      flash[:alert] = "Sorry! You can't edit someone else's post."
      redirect_to posts_url
    end
    return if @post

    redirect_to root_path
  end

  def update
    @post = Post.where(id: params[:id]).first
    
    if @post.update(message: params[:post][:message])
      flash[:notice] = 'Successfully updated the post!'
      redirect_to "/users/#{params['previous_wall_id']}"
    else
      flash[:alert] = 'Couldn’t edit the post...'
      render :edit
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    if current_user != @post.user
      flash[:alert] = "Sorry! You can't delete someone else's post." 
    elsif @post.destroy
      flash[:notice] = 'Successfully deleted the post!'
    else
      flash[:alert] = 'Couldn’t delete the post...'
    end
    redirect_to posts_url
  end

  def index
    @@wall_id = params['id']
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def post_params(wall_id)
    params.require(:post).permit(:message).merge(user_id: current_user.id, wall_id: wall_id)
  end

end
