require 'bcrypt'
class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to(posts_path, notice: 'You cannot login while logged in') if session[:user]
  end

  def create
    # check email validity
    return redirect_to(login_path, notice: 'Email format invaild, please enter valid email') unless EmailValidator.validate?(params[:login][:email])

    # check credentials
    user = User.find_by(email: params[:login][:email])
    return redirect_to(login_path, notice: 'Login not found') unless user
    password_ok = BCrypt::Password.new(user.password) == params[:login][:password]
    return redirect_to(login_path, notice: 'Login not found') unless password_ok

    # check if user logged in

    # log in
    session[:user] = user

    # add login record
    Session.new(user_id: user.id).save!

    # redirect to posts
    redirect_to(posts_path, notice: "Welcome back #{user.email}!")
  end

  def destroy
    user_session = Session.find_by(user_id: session[:user][:id], logged_out: nil)
    user_session.update(logged_out: Time.now)
    user_session.save!
    session[:user] = nil
    redirect_to(root_path, action: 'You have been logged out')
  end
end
