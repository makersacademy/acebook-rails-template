class SessionsController < ApplicationController

  def new 
  end

  def create
    @user = User.authenticate(username: params[:username], password: params[:password])
    if @user 
      session[:user_id] = user.id
      redirect_to route_url
    else
      flash[:notice] = "Username or password incorrect, please try again."
      redirect_to new
    end
  end
end
