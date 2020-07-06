class WallController < ApplicationController

  def new
    p params
    @wall_id = params[:id]
    @post = Post.new
    @user_id = current_user.id
    # create view with form for @posts - leads to Post at '/posts'
  end

  def show
    @username = User.find(params[:id]).username
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

end
