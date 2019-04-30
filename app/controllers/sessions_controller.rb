# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email_address].downcase)
    if user
      if user.authenticate(params[:session][:password])
        log_in(user)
        flash[:success] = "Logged in successfully"
        redirect_to "/#{current_user.id}"
      else
        flash[:danger] = "Invalid password"
        redirect_to login_path
        # show an error message
      end
    else
      flash[:danger] = "There isn't an account for this email address"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You are logged out"
    redirect_to root_url
  end
end
