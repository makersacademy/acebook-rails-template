class WallController < ApplicationController

  def new
    p params
    @wall = params[:id]
    @post = Post.new
    @user_id = current_user.id
  end

  def show
    @username = User.find(params[:id]).username
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

end
