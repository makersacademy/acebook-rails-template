# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_posts
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "can't like more than once"
    else
     @post.likes.create(user_id: current_user.id)
    end
    redirect_to posts_url
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = 'cant unlike'
    else
      @like.destroy
    end
    redirect_to posts_url
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def find_posts
    @post = Post.find(params[:post_id])
  end
  
end
