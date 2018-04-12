# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post

  def create
    @post.likes.create
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
