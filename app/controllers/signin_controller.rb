class SigninController < ApplicationController
  def index
    # @user = Signup.find_by(username: params[:username])
  end

  def new
  end

  def create
    unless Signup.find_by(id: session[:user_id]) == nil
       # Signup.find(
       session[:user_id] = nil
       session[:user] = nil

    end

    @user = Signup.find_by(username: params[:signin][:username])
    if @user && @user.authenticate(params[:signin][:password])
      session[:user] = @user
      session[:user_id] = @user.id
      session[:current_user] = @user
      redirect_to posts_url
    else
      render 'new'
    end

  end

  def destroy
    Signup.find_by(id: session[:user_id])
    # @delete = Signup.find(session[:user_id])
    session[:user] = nil
    session[:user_id] = nil
    redirect_to "/signin"
  end

end
