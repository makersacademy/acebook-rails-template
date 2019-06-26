# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Welcome to Acebook by D-Railed!'

      (redirect_to posts_path) && return
    else
      render :new
    end
  end

  private

  def signup_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

end
