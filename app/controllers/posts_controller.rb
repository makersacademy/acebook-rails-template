# frozen_string_literal: true

# Logic for the Posts routes, allows us to create and index posts currently.
class PostsController < ApplicationController
  include PostsHelper
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_back(fallback_location: root_url)
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def edit_profile_post
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.profile_message == true
      redirect_to ('/' + params[:post][:profile_id])
    else
      redirect_to posts_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: root_url)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.build
    @user = User.find(current_user.id)
  end

  private

  def post_params
    output = params.require(:post).permit(:message, :profile_message)
    output[:user_id] = current_user.id
    output
  end
end
