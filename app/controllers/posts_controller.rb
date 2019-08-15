# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    # @post.update(post_params)
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end




def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
  redirect_to @post
else
  render 'edit'
end
end


  def index
    @posts = Post.order(created_at: :desc)
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    flash[:success] = "You can't delete another users post!"
    redirect_to '/posts' if @post.nil?
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
