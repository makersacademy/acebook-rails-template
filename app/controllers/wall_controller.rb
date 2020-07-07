class WallController < ApplicationController

  def new
    @wall_id = params[:id]
    @post = Post.new
    @user_id = current_user.id
    # create view with form for @posts - leads to Post at '/posts'
  end

  def edit
    @wall_id = params[:id]
    @post = Post.new
    @user_id = current_user.id
  end

  def show
    @username = User.find(params[:id]).username
    @posts = Post.where("wall_id = ?", params[:id]).sort_by{ |post| post[:created_at] }.reverse
  end

end
