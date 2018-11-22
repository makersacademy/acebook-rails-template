# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params[:message],
                        user_id: session[:user_id])
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def edit
    @post = Post.find(params[:id])
    if not_authorised?
      prevent_edit('You can only edit your own posts')
    elsif not_editable?
      prevent_edit('You can no longer edit this post')
    end
  end

  def update
    @post = Post.find(params[:id])
    redirect_to posts_url if @post.update(message: post_params[:message])
  end

  def destroy
    @post = Post.find(params[:id])
    if not_authorised?
      flash[:danger] = "You cannot delete someone else's post"
    else
      @post.destroy
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def require_login
    prevent_view unless logged_in?
  end
end
