# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate_user, only: %i[home profile setting]
  before_action :save_login_state, only: %i[login login_attempt]

  def login
    # Login Form
  end

  def login_attempt
    user = User.find_by(email: params[:sessions][:email])
    if user&.authenticate(params[:sessions][:password])
      successful_login(user)
    else
      unsuccessful_login
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to action: 'login'
  end

  private

  def successful_login(user)
    flash[:notice] = "Welcome back, you are logged in as #{user.email}"
    session[:user_id] = user.id
    redirect_to('/posts/index')
  end

  def unsuccessful_login
    flash[:notice] = 'Invalid Username or Password'
    flash[:color] = 'invalid'
    render 'login'
  end
end
