class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to posts_url
    else
      flash[:danger] = "Invalid email/password combination!"
      redirect_to '/login'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
