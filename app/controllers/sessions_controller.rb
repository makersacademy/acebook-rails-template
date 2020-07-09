  # frozen_string_literal: true

class SessionsController < ApplicationController

  skip_before_action :require_login
  def new; end

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to posts_url
    else
      flash[:login_errors] = ['Incorrect E-mail/Password Combination']
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
