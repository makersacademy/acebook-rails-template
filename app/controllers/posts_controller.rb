# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge({user_id: current_user.id}))
    flash[:danger] = "Post Added. Nobody cares.."
    redirect_to posts_url
  end

  def index
    @posts = Post.order('created_at DESC')
  end

  def destroy
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
    @comments.each { |comment| comment.destroy }
    @post.destroy
    flash[:danger] = "Post deleted. Embarrassed yourself again?"
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.editable?
      @post.update(message: params[:post][:message])
      flash[:danger] = "Post updated. Yet another typo?"
    else
      flash[:danger] = "Fuck off, this is not yours!"
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
