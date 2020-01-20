class SessionsController < ApplicationController
  def new
  end

  def show
    session[:user_id] = nil
    redirect_to '/login'
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/posts' 
    else
      redirect_to '/login', notice: 'Invalid email/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Logged out!' if session[:user_id].nil?
  end
end
