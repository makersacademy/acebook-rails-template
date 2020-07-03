# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to posts_url
    else
      flash[:login_errors] = ["Incorrect E-mail/Password Combination"]
      redirect_to '/login'
    end
  end
end
