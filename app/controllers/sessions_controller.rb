# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if user
      session['user_id'] = user.id
      flash[:notice] = 'Log in success'
      redirect_to user
    else
      flash[:alert] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been loged out'
    redirect_to login_path
  end
end
