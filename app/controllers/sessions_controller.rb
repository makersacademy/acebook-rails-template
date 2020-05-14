class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to sessions_new_path, alert: "Name and/or Password is incorrect"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end
end
