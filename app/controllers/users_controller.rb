# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
