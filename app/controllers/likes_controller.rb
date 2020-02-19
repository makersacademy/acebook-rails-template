# frozen_string_literal: true

class LikesController < ApplicationController
  skip_before_action :authenticated_user
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to session[:url]
  end

  def destroy
    if !already_liked?
      flash.now.alert = 'Apologies, you cannot unlike this'
    else
      @like.destroy
    end
    redirect_to session[:url]
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
