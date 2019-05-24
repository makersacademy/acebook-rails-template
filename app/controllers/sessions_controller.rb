class SessionsController < ApplicationController
  def new 
  end

  def create
    user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if user
      redirect_to user
    else   
      render 'new'
    end
  end

  def destroy 
  end
end
