class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
