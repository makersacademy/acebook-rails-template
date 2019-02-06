# frozen_string_literal: true

class PostsController < ApplicationController
  
def new
  # raise params.inspect
  user = User.find(params[:user_id])
  #because user has many posts 
  @post = user.posts.build
  end

  def index
    @posts = Post.all
  end

  def create
    user = User.find(params[:user_id])
    @post =  user.posts.build(post_params).save
    redirect_to user
    #if want to go back to own page @post.user
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to current_user
  rescue ActiveRecord::RecordNotFound
    @post = Post.find(params[:id])
    flash.now[:alert] = "NOT YOUR POST"
    render :show
  end
  
  def edit
    @post = Post.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   @post = Post.find(params[:id])
  #   flash.now[:alert] = "NOT YOUR POST"
  #   render :show
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
