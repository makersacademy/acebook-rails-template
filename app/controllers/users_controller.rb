# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    email = params[:user][:email_address].downcase
    password = params[:user][:password]


    user = User.new(email: email, password: password)

    if user.valid?
      user.save
      session[:user_id] = user.id
      flash[:success] = "New account created"
      redirect_to posts_path and return
    else
      flash[:danger] = user.errors.full_messages.join("<br>")
    end

    redirect_to root_path
  end
end
