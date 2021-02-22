class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /login
  def new
  end

  # POST /session
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to user_url(user.id)
    else
      flash[:danger] = "Incorrect username or password"
      redirect_back fallback_location: "/"
    end
  end

  # DELETE /session
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to "/"
  end

end
