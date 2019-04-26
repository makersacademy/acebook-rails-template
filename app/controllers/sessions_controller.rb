# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email_address].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Logged in successfully"
      redirect_to posts_path
    else
      flash[:danger] = "Invalid password"
      redirect_to login_path
      # show an error message
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You are logged out"
    redirect_to root_url
  end
end
