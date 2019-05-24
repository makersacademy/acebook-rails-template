class SessionsController < ApplicationController
  def new 
  end

  def create
    user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if user
      flash[:notice] = "Log in success"
      redirect_to user
    else
      flash[:alert] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy 
  end
end
