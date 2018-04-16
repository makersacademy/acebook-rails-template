# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post


#likes database has a comment_id and a post_id as foreign keys.

  def create
    like = Like.create(comment_id: nil, post_id: params[:post_id] )
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
