class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to posts_url, notice: "Welcome to Acebook, #{user.username}!"
    else
      flash[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    p "put your hands up"
    logout_url
    session[:user_id] = nil
    p "up in the club, doing my thang"
    redirect_to root_url
  end
end
