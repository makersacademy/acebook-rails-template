class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Signed in successfully'
      redirect_to posts_url
    else
      flash.now[:alert] = 'Invalid login details'
      render 'new'
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'Successfully signed out'
    redirect_to new_session_url
  end
end