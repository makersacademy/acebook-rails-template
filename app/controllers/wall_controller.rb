class WallController < ApplicationController
  before_action :require_login
  def index
    @user = User.find(params[:user_id])
    @posts = @user.wall.posts
  end
end
