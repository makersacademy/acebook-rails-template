# frozen_string_literal: true

# Controller for the comments
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.where(profile_message: params[:id])
    @post = Post.new
    @comments = @post.comments.all
    @comment = @post.comments.build
    @image_posts = ImagePost.all
  end
end
