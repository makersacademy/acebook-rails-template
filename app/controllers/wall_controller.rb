class WallController < ApplicationController
  before_action :require_login
  def index
    session[:host_user_id] = params[:user_id]
    @user = User.find(params[:user_id])
    @posts = @user.wall.posts
  end
end
