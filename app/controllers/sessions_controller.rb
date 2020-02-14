require 'bcrypt'
class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to(posts_path, notice: 'You cannot login while logged in') if session[:user]
  end

  def create
    # check credentials
    user = User.find_by(email: params[:login][:email])
    return redirect_to(login_path, notice: 'Login not found') unless user
    password_ok = BCrypt::Password.new(user.password) == params[:login][:password]
    return redirect_to(login_path, notice: 'Login not found') unless password_ok

    # log in
    session[:user] = user

    # add login record
    Session.new(user_id: user.id).save

    # redirect to posts
    redirect_to(posts_path, notice: "Welcome back #{user.email}!")
  end
end
