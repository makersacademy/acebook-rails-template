# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p 'Here'
    p user_params

    @user = User.create(user_params)
    p @user.save
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
