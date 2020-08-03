class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :login]


  def new
  end

  def create
    p "we're in def create"
   @user = User.find_by(email: params[:email])
   p @user
   if @user && @user.authenticate(params[:password])
     p "You got into the if statement good job"
      session[:user_id] = @user.id
      redirect_to '/posts'
   else
     p "You got into the else statement good job"
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
