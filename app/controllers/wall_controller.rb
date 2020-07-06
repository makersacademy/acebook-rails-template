class WallController < ApplicationController

  def show
    @username = User.find(params[:id]).username
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

end
