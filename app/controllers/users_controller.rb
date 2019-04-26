# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    email = params[:user][:email_address].downcase
    password = params[:user][:password]

    user_with_same_email = User.find_by(email: email)

    user = User.new(email: email, password: password)

    if user.valid?
      user.save
      session[:user_id] = user.id
      flash[:success] = "New account created"
      redirect_to posts_path
    else
      if user_with_same_email
        flash[:danger] = "An account with this email already exists"
      elsif user.errors[:email].any? 
        flash[:danger] = "Invalid email address"
      elsif user.errors[:password].any?
        flash[:danger] = "Invalid password"
      end
      redirect_to root_path
    end
  end
end
