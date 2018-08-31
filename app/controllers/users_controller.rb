# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Successfully signed up'
      redirect_to '/home'
    else
      redirect_to '/signup'
      flash[:warning] = 'Your user account has not been created - please try again!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
