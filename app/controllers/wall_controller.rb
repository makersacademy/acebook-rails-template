class WallController < ApplicationController
  before_action :require_login
  def index
    puts "DEBUG PARAMS #{params}"
    @user = User.find(params[:user_id])
    @posts = @user.wall.posts
  end
end
