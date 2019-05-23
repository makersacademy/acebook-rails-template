class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    User.find_by(id:session["user_id"])
    session[:user_id] = nil
    redirect_to login_url
  end
end
