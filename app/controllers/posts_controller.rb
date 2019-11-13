# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @wall_id = params['wall_user_id']
    @post = Post.new
  end

  def create
    @post = Post.create(post_params(params['wall']))
    redirect_to "/users/#{params['wall']}"
  end

  def edit
    set_post
    return if current_user == @post.user && @post.not_editable? == false

    if not_curr_user?
      flash[:alert] = "Sorry! You can't edit someone else's post."
    elsif curr_user? && @post.not_editable?
      flash[:alert] = "10 minutes exceeded: you can no longer edit the post."
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to "/users/#{@post.wall_id}"
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to "/users/#{@post.wall_id}"
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(message: params[:post][:message])
      redirect_to "/users/#{@post.wall_id}"
    else
      render 'edit'
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
    @posts = Post.all
  end

  private

  def set_post
    @post = Post.where(id: params[:id]).first
  end

  def post_params(wall_id)
    params.require(:post).permit(:message).merge(user_id: current_user.id, wall_id: wall_id)
  end

  def curr_user?
    @post.user

    redirect_to "/users/#{@post.wall_id}"
  end

  def not_curr_user?
    return unless current_user != @post.user

    redirect_to "/users/#{@post.wall_id}"
  end

end
