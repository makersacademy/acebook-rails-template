# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    not_signed_in_redirect
    session[:return_to] ||= request.referer
    @post = Post.new
  end

  def create
    not_signed_in_redirect
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to session.delete(:return_to)
  end

  def index
    not_signed_in_redirect
    @user = current_user
    @posts = Post.all
  end

  def edit
    not_signed_in_redirect
    session[:return_to] ||= request.referer
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to session.delete(:return_to)
  end

  def destroy
    session[:return_to] ||= request.referer
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to session.delete(:return_to)
  end


  private

  def post_params
    params.require(:post).permit(:message)
  end
end
