class WallController < ApplicationController

  def show
    user_id = params[:user_id]
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

end
