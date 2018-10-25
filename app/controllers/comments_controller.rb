class CommentsController < ApplicationController
  before_action :find_post

  def create
    @post.comments.create(user_id: current_user.id, comment: params[:comment])
  end

  def show
  end

  private 
  def find_post
    @post = Post.find(params[:post_id])
  end
end