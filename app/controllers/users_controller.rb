# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login

  protect_from_forgery
  def new
    @user = User.new
  end

  def create
    if /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/.match?(user_params[:email])
      @user = User.create(user_params)
      log_in(@user)
      flash[:success] = 'Congratulations, you are signed up!'
      redirect_to posts_url
    else
      flash[:bad_email] = 'This email address is invalid'
      redirect_to('/users/new')
    end
  end

  private

  def user_params
    params.require(:user).permit(%i[email password])
  end
end
