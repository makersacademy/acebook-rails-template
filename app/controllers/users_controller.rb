class UsersController < ApplicationController
  protect_from_forgery

  # def new
  #   @user = User.new
  # end

  def create
    redirect_to posts_url
  end
end
