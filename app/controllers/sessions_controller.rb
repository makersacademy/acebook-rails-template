class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :login]


  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/posts'
    else
       redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end

  def destroy
   # Remove the user id from the session
   current_user = session[:user_id] = nil
   redirect_to root_url
  end
end
