class SessionsController < ApplicationController

  protect_from_forgery

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to posts_path
    else
      flash[:login_errors] = ['Invalid email/password combination']
      render 'new'
    end
  end

  def destroy
  end
end
