class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new,:login,:welcome, :create]
  
  def new
    p '------ I AM IN NEW ----------'
  end

  def create
    user = User.find_by_email(params[:email])
    p user 
    if user && user.authenticate(params[:password])
      p '------ I AM IN THE IF BLOCK ----------'
      session[:user_id] = user.id 
      redirect_to posts_url, notice: "Your are Logged in!"
    else 
      flash.now[:alert] = "Email or Password not valid"
      render "login"
    end 
  end

  def login
  
  end

  def welcome

  end
end
