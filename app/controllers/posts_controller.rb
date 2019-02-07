# frozen_string_literal: true

class PostsController < ApplicationController
  
  def new
    # raise params.inspect
    user = User.find(params[:user_id])
    # sender = User.find(current_user.id)
    #because user has many posts 
    @post = user.posts.build
  end

  def index
    @posts = Post.all
  end

  def create
    #this is what identifies which wall to put it on
    user = User.find(params[:user_id])
    # sender = User.find(current_user.id)
    @post = user.posts.build(post_params.merge(:sender_id => current_user.id)).save
   
  
    redirect_to user
    #if want to go back to own page @post.user
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.sender_id == current_user.id
      @post.destroy
      redirect_to current_user
    else
      flash.now[:alert] = "NOT YOUR POST"
      render :show
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    unless @post.sender_id == current_user.id 
      flash.now[:alert] = "NOT YOUR POST"
      render :show
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
