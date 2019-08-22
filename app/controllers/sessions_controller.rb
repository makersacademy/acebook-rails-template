class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user_path(user.id), notice: "Welcome to Acebook, #{user.username}!"
    else
      flash[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    logout_url
    session[:user_id] = nil
    redirect_to root_url
  end
end
