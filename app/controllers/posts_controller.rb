# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params(@@wall_id)) do |post|
    post.user = current_user
    if @post.save
      redirect_to "/users/#{@post.wall_id}"
    end
  end

  def edit
     @previous_wall_id = params['previous_wall_id']
    set_post
    if not_curr_user?
      flash[:alert] = "Sorry! You can't edit someone else's post."
    elsif @post.not_editable?
      flash[:alert] = "10 minutes exceeded: you can no longer edit the post."
      redirect_to posts_url
    end
    return if @post
    redirect_to root_path
  end

  def update
    set_post
    if @post.update(message: params[:post][:message])
      flash[:notice] = 'Successfully updated the post!'
      redirect_to "/users/#{params['previous_wall_id']}"
    else
      flash[:alert] = 'Couldn’t edit the post...'
      render :edit
    end
  end

  def destroy
    set_post
    if not_curr_user?
      flash[:alert] = "Sorry! You can't delete someone else's post."
    elsif curr_user? && @post.can_destroy?
      flash[:notice] = 'Successfully deleted the post!'
    end
  end

  def index
    @@wall_id = params['id']
    @posts = Post.all
  end

  private

  def set_post
    @post = Post.where(id: params[:id]).first
  end

  def post_params
    params.require(:post).permit(:message)
  end

  def post_params(wall_id)
    params.require(:post).permit(:message).merge(user_id: current_user.id, wall_id: wall_id)
  end

  def curr_user?
    @post.user
    redirect_to posts_url
  end

  def not_curr_user?
    return unless current_user != @post.user
    redirect_to posts_url
  end

end
