# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Welcome to Acebook by D-Railed!'
      (redirect_to user_posts_path(current_user)) && return
    else
      flash[:invalid_details] = 'Invalid email or password.'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
