require 'bcrypt'

class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to(posts_path, notice: 'You cannot login while logged in') if session[:user_id]
  end

  def create
    # check email validity
    return redirect_to(login_path, notice: 'Email format invaild, please enter valid email') unless EmailValidator.validate?(params[:login][:email])

    # check credentials
    user = User.find_by(email: params[:login][:email])
    return redirect_to(login_path, notice: 'Login not found') unless user
    password_ok = BCrypt::Password.new(user.password) == params[:login][:password]
    return redirect_to(login_path, notice: 'Login not found') unless password_ok

    # log in
    session[:user_id] = user.id

    # redirect to posts
    redirect_to(posts_path, notice: "Welcome back #{user.email}!")
  end

  def destroy
    # Log user out
    session[:user_id] = nil
    redirect_to(root_path, notice: 'You have been logged out')
  end
end
